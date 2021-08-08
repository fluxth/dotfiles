#!/bin/bash

DOTFILE_DIRS=(
    bin
    editor
    gui
    personal
    shell
)

STOW_EXCLUDE=(
    .DS_Store
    .gitignore
    .git
)

show_help(){
    cat <<EOF
Usage: $0 [options] actions ...

Actions: [can chain multiple actions]
  install                   installs the required packages and links dotfiles
  full-install              installs required and GUI related packages links dotfiles
  link                      links the dotfiles to your XDG directories (default)
  unlink                    unlinks the dotfiles in your XDG directories
  relink                    shorthand for running "unlink link"
  clean                     deletes all the present configuration from your XDG directories

Options: [defaults in brackets after descriptions]
Help options:
  -h, --help                    print this message
  --exclude-dir=dir1,dir2,...   exclude dotfiles directory from linking
EOF
}

STOWFLAGS=""
MACHINE_OS="Unknown"
DOTFILE_ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

exclude_dir_register(){
    local vals=$1
    IFS=',' read -ra ARR <<< "$vals"

    for val in "${ARR[@]}"; do
        if [[ "${DOTFILE_DIRS[@]}" =~ $val ]]; then
            DOTFILE_DIRS=("${DOTFILE_DIRS[@]/$val}")
        else
            echo "Error: Unknown exclude directory \"$val\""
            exit 1
        fi
    done

    # Strip gaps that happens when removing element from an array
    local temp_arr=()
    for i in "${!DOTFILE_DIRS[@]}"; do
        temp_arr+=(${DOTFILE_DIRS[i]})
    done

    DOTFILE_DIRS=("${temp_arr[@]}")
}

build_stowflags(){
    for dir in "${STOW_EXCLUDE[@]}"; do
        STOWFLAGS+="--ignore=$dir "
    done
}

check_command(){
    if command -v $1 &> /dev/null; then
        return 0
    fi
    return 1
}

check_command_exit(){
    if ! check_command $1; then
        echo "Error: \"$1\" not found in PATH, please check that it is installed."
        exit 1
    fi
}

detect_os(){
    local uname_s="$(uname -s)"
    case "$uname_s" in
        Darwin*) MACHINE_OS="macOS" ;;
        Linux*)
            MACHINE_OS="Linux"

            # Detect distro
            if ! check_command pacman; then
                echo "Warning: You are using Linux, but your distro is not supported."
                echo "Script will continue, but it will likely fail."
                echo
            fi
        ;;
    esac
}

filter_os(){
    if [[ $MACHINE_OS == "Unknown" ]]; then
        echo "Error: fluxth's dotfiles is not supported on this platform."
        echo "Currently supported platforms:"
        echo "  - macOS"
        echo "  - Linux"
        echo "    - Arch Linux (Full Support)"
        echo "    - Other Distros (Partial Support)"
        echo
        echo "If you think this is an error, please send a pull request on GitHub."
        exit 1
    fi
}

file_is_in_symlink(){
    local filename=$1
    while [[ ! "$filename" == "/" ]]; do
        filename=$(dirname $filename)
        if [[ -L "$filename" ]]; then
            return 0
        fi
    done
    return 1
}

## Hooks

post_install(){
    echo "Running post-install scripts..."
    set -e

    $DOTFILE_ROOT_DIR/scripts/postlink.sh

    if [[ $MACHINE_OS == "macOS" ]]; then
        $DOTFILE_ROOT_DIR/scripts/platform/macos/postlink.sh
    elif [[ $MACHINE_OS == "Linux" ]]; then
        $DOTFILE_ROOT_DIR/scripts/platform/linux/postlink.sh
    fi

    set +e
}

post_full_install(){
    if [[ $MACHINE_OS == "Linux" ]]; then
        $DOTFILE_ROOT_DIR/scripts/platform/linux/gui_postlink.sh || exit 1
    fi
}

install(){
    echo "Installing required packages..."
    set -e

    $DOTFILE_ROOT_DIR/scripts/prelink.sh

    if [[ $MACHINE_OS == "macOS" ]]; then
        echo "OS detected as Apple macOS"
        $DOTFILE_ROOT_DIR/scripts/platform/macos/prelink.sh
    elif [[ $MACHINE_OS == "Linux" ]]; then
        echo "OS detected as GNU/Linux"
        $DOTFILE_ROOT_DIR/scripts/platform/linux/prelink.sh
    fi

    set +e
}

full_install(){
    if [[ $MACHINE_OS == "Linux" ]]; then
        echo "Installing GUI packages..."
        $DOTFILE_ROOT_DIR/scripts/platform/linux/gui_prelink.sh || exit 1
    else
        echo "GUI packages will not install as it is not supported on your platform."
    fi
}

## Actions

link(){
    set -e
    echo "Symlinking dotfiles..."
    for dir in "${DOTFILE_DIRS[@]}"; do
        echo "+ Linking \"$dir\""
        stow $STOWFLAGS $dir
    done
    set +e
}

unlink(){
    set -e
    echo "Removing symlinks to dotfiles..."
    for dir in "${DOTFILE_DIRS[@]}"; do
        echo "- Unlinking \"$dir\""
        stow -D $STOWFLAGS $dir
    done
    set +e
}

clean(){
    set -e

    local find_exclude=""
    for item in "${STOW_EXCLUDE[@]}"; do
        find_exclude+="-not -name $item "
    done

    local clean_files=()
    for dir in "${DOTFILE_DIRS[@]}"; do
        cd $dir
        for file in $(find . -type f $find_exclude); do
            local filename="$HOME$(echo $file | sed 's/^.//')"
            if [[ -f "$filename" ]] && [[ ! -L "$filename" ]] && ! file_is_in_symlink "$filename"; then
                clean_files+=("$filename")
            fi
        done
        cd ..
    done

    if [[ "${#clean_files[@]}" == "0" ]]; then
        echo "Your XDG directories are already clean."
        exit 0
    fi

    echo "Warning: \"clean\" will destructively delete the following files:"
    for file in "${clean_files[@]}"; do
        echo "    $file"
    done

    echo
    read -p "Deleted files cannot be recovered! Continue? [y/N] " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        for file in "${clean_files[@]}"; do
            echo "Cleaning \"$file\"..."
            rm -f "$file"
        done
    else
        echo "Aborting."
        exit 1
    fi

    set +e
}

# check os
detect_os
filter_os

# check commands
check_command_exit "stow"
check_command_exit "curl"

ACTIONS=(
    install
    full-install
    link
    unlink
    relink
    clean
)

# validation and preparation
action_count=0
for opt do
    case "$opt" in
        --help|-h) 
            show_help
            exit 0
        ;;
        --exclude-dir=?*) exclude_dir_register ${opt#--exclude-dir=} ;;
        -*)
            echo "Error: Unknown Option \"$opt\"."
            echo "See $0 --help for avaliable options."
            exit 1
        ;;
        *)
            if [[ ! "${ACTIONS[@]}" =~ $opt ]]; then
                echo "Error: Unknown Action \"$opt\"."
                echo "See $0 --help for avaliable options."
                exit 1
            fi
            let action_count++
        ;;
    esac
done
build_stowflags

# actually running actions
if [[ $action_count == 0 ]]; then
    link
    exit 0
fi

for opt do
    case "$opt" in
        install) 
            install 
            link 
            post_install
        ;;
        full-install) 
            install
            full_install
            link
            post_install
            post_full_install
        ;;
        link) link ;;
        unlink) unlink ;;
        relink) 
            unlink
            link
        ;;
        clean) clean ;;
    esac
done
