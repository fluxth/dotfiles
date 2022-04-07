#!/usr/bin/env bash

DOTFILE_DIRS=(
    bin
    editor
    gui
    work
    shell
)

STOW_EXCLUDE=(
    # These strings are perl regex
    '\.DS_Store'
    '\.gitignore'
    '\.git'
)

CLEAN_EXTRA_ITEMS=(
    # Relative to target directory
    ".config/mpv/youtube-dl"
)

DEBUG=${DEBUG:-0}
REQUIRED_BINARIES=(stow)
REQUIRED_INSTALL_BINARIES=(curl)
STOWFLAGS=""

print_help(){
    cat <<EOF
Usage: $0 [OPTIONS] ACTION

Actions:
    link                  symlink dotfiles to your target directory
    unlink                unlink dotfiles from your target directory
    relink                relink dotfiles to your target directory
    install <PROFILE...>  install packages for PROFILE(s), see profile list below
    clean                 delete all existing configurations that conflicts dotfiles

Install profiles:
    base            install only required packages (minimal install, will link dotfiles)
    desktop         install linux desktop packages
    extra           install extra optional packages

Options:
    -h, --help          print this message
    -t, --target=<dir>  target directory to link dotfiles to (default: $HOME)
    -d, --dry-run       just show me what you're going to do, but don't do it just yet
    --expert            enable expert mode, use with caution!
EOF
}

DOTFILES_ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
DOTFILES_SETUP_DIR="setup"

OPT_TARGET_DIR="$HOME"
OPT_DRY_RUN=0
OPT_EXPERT=0

DETECTED_OS="unknown"
DETECTED_OS_VARIANT=""

BOLD_COLOR=$(tput bold)
DEBUG_COLOR=$(tput setaf 4)
WARN_COLOR=$(tput setaf 3)
ERROR_COLOR=$(tput setaf 1)
SUCCESS_COLOR=$(tput setaf 2)
INFO_COLOR=$(tput setaf 5)
HEADER_COLOR=$(tput setaf 6)
RESET_COLOR=$(tput sgr0)

log(){ echo $*; }

log_header(){
    log "${BOLD_COLOR}${HEADER_COLOR}◦ $*${RESET_COLOR}"
}

log_success(){
    log "${BOLD_COLOR}${SUCCESS_COLOR}✔ $*${RESET_COLOR}"
}

log_progress(){
    log "${BOLD_COLOR}${INFO_COLOR}➤➤➤ $*${RESET_COLOR}"
}

log_warn(){
    log "${WARN_COLOR}$*${RESET_COLOR}"
}

log_err(){
    >&2 log "${ERROR_COLOR}$*${RESET_COLOR}"
}

log_dbg(){
    if [[ $DEBUG == "1" ]]; then
        if [[ $1 == "-"* ]]; then
            local flag=$1
            shift
            log $flag "${DEBUG_COLOR}$*${RESET_COLOR}"
        else
            log "${DEBUG_COLOR}$*${RESET_COLOR}"
        fi
    fi
}

# Utils

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

mkdircd(){
    log_dbg "Creating and entering \"$1\"..."
    mkdir -p $1
    cd $1
}

detect_os(){
    case "$OSTYPE" in
        linux*)
            DETECTED_OS="linux"
            local distro=$(awk -F= '/^NAME/{print $2}' /etc/os-release | sed 's/"//g')
            case "$distro" in
                "Manjaro Linux") ;&
                "Arch Linux")
                    DETECTED_OS_VARIANT="archlinux"
                    REQUIRED_INSTALL_BINARIES+=(yay)
                ;;
            esac
        ;;
        darwin*)
            DETECTED_OS="macos"
            DETECTED_OS_VARIANT=$(uname -m)
            REQUIRED_INSTALL_BINARIES+=(brew)
        ;;
        msys*)   ;&
        cygwin*) ;&
        win32*)  DETECTED_OS="windows" ;;
    esac
}

gate_os(){
    local mode=$1; shift
    log_dbg "Gate OS/distro"
    case "$DETECTED_OS" in
        linux)
            if [[ $mode == "strict" ]] && [[ $DETECTED_OS_VARIANT == "" ]]; then
                log_err "Error: Linux distribution detection failed"
                log_err $*
                exit 1
            fi
        ;;
        macos) ;;
        windows)
            log_err "Error: Windows is not supported!"
            if [[ $mode == "strict" ]]; then
                log_err $*
            fi
            exit 1
        ;;
        *)
            if [[ $mode == "strict" ]]; then
                log_err "Error: OS detection failed"
                log_err $*
                exit 1
            fi
        ;;
    esac
}

gate_binaries(){
    local gated=0
    local bins=$*
    log_dbg "Gate binaries: $bins"

    for bin in $*; do
        if ! command -v $bin &> /dev/null; then
            log_err "Error: Binary \"$bin\" is required"
            gated=1
        fi
    done

    if [[ $gated == 1 ]]; then
        log_err "Please make sure they are accessible from PATH and try again."
        exit 1;
    fi
}

gate_file(){
    if [[ ! -f $1 ]]; then
        log_err "Error: File \"$1\" not found"
        exit 1
    fi
}

join_path(){
    # TODO: Support joining more than 2 paths
    local right=$2
    if [[ ${right::1} == "/" ]]; then
        echo -n $right
    else
        local left=$(echo -n $1 | sed 's/\/$//')
        echo -n "$left/$right"
    fi
}

build_stowflags(){
    if [[ ! -d "$OPT_TARGET_DIR" ]]; then
        log_err "Error: Target directory \"$OPT_TARGET_DIR\" does not exist"
        exit 1
    fi
    STOWFLAGS+="--target=$OPT_TARGET_DIR "

    for dir in "${STOW_EXCLUDE[@]}"; do
        STOWFLAGS+="--ignore='$dir' "
    done
}

list_file_data=()
read_list_file(){
    list_file_data=()
    log_dbg "Reading listfile data from: \"$1\""
    gate_file $1
    while read -r line; do
        if [[ ${line::1} != "#" ]] && [[ "$line" != "" ]]; then
            list_file_data+=("$line")
        fi
    done <$1
}

read_list_file_dir(){
    list_file_data=()
    log_dbg "Reading listfile dirs from: \"$1\""
    gate_file $1
    while read -r line; do
        if [[ ${line::1} != "#" ]] && [[ "$line" != "" ]]; then
            local file=$(join_path $OPT_TARGET_DIR $line)
            list_file_data+=("$file")
        fi
    done <$1
}

run_cmd(){
    local cmd=$*
    if [[ $OPT_DRY_RUN == 1 ]]; then
        log_warn "[dry-run] $cmd"
    else
        log_dbg "\$ $cmd"
        ${cmd[@]}
        log_dbg "return_code = $?"
    fi
}

is_platform(){
    local os=$1
    local variant=$2

    if [[ $os != $DETECTED_OS ]]; then
        return 1
    fi

    if [[ $variant == "" ]]; then
        # Don't check for variant
        return 0
    fi

    if [[ $variant != $DETECTED_OS_VARIANT ]]; then
        return 1
    fi

    return 0
}

install_pkg_list(){
    local list_file=$1
    log_progress "Installing packages from \"$list_file\""

    local list_prefix=$(join_path $DOTFILES_ROOT_DIR $DOTFILES_SETUP_DIR/packages/$DETECTED_OS)
    if is_platform "linux"; then
        list_prefix+="/$DETECTED_OS_VARIANT"
    fi

    read_list_file "$list_prefix/$list_file"

    local packages=()
    local packages_aur=()
    local packages_cask=()

    for pkg in "${list_file_data[@]}"; do
        if [[ $pkg =~ ":" ]]; then
            local pkg_type=$(echo -n $pkg | cut -d ':' -f1)
            local pkg_name=$(echo -n $pkg | cut -d ':' -f2)
            case "$pkg_type" in
                aur) packages_aur+=($pkg_name) ;;
                cask) packages_cask+=($pkg_name) ;;
                *)
                    log_err "Error: Unknown package type for \"$pkg\""
                    exit 1
                ;;
            esac
        else
            packages+=($pkg)
        fi
    done

    if is_platform "linux" "archlinux"; then
        if [[ "${#packages[@]}" != 0 ]]; then
            log_progress "Installing ${#packages[@]} packages (yay)"
            log_dbg "Packages: ${packages[@]}"
            yay -S --needed --noconfirm ${packages[@]}
        fi

        if [[ "${#packages_aur[@]}" != 0 ]]; then
            log_progress "Installing ${#packages_aur[@]} AUR packages (yay)"
            log_dbg "Packages: ${packages_aur[@]}"
            yay -S --needed --noconfirm ${packages_aur[@]}
        fi
    elif is_platform "macos"; then
        if [[ "${#packages[@]}" != 0 ]]; then
            log_progress "Installing ${#packages[@]} packages (brew)"
            log_dbg "Packages: ${packages[@]}"
            brew install ${packages[@]}
        fi

        if [[ "${#packages_cask[@]}" != 0 ]]; then
            log_progress "Installing ${#packages_cask[@]} cask packages (brew)"
            log_dbg "Packages: ${packages_cask[@]}"
            brew install --cask ${packages_cask[@]}
        fi
    else
        log_err "Error: Cannot install packages for unsupported platform"
        exit 1
    fi
}

# Hooks

hook_pre_link(){
    log_dbg "Ensuring file links..."
    read_list_file_dir $(join_path $DOTFILES_ROOT_DIR "$DOTFILES_SETUP_DIR/ensure/file_links.list")

    for dir in "${list_file_data[@]}"; do
        log_dbg $dir
        run_cmd "mkdir -p $dir"
    done

    log_dbg "Ensuring directory links..."
    read_list_file_dir $(join_path $DOTFILES_ROOT_DIR "$DOTFILES_SETUP_DIR/ensure/dir_links.list")

    local dir_link_error=0
    for dir in "${list_file_data[@]}"; do
        log_dbg $dir
        if [[ -d $dir ]]; then
            log_err "Error: Directory \"$dir\" must be empty"
            dir_link_error=1
        fi
    done

    if [[ $dir_link_error != "0" ]]; then
        log_err "Directory symlinks needed to be created there."
        exit 1
    fi
}

hook_post_link(){
    :
}

hook_pre_unlink(){
    :
}

hook_post_unlink(){
    # TODO: Clean up dirs for ensure file links
    # TODO: Check for files to be cleaned and display
    :
}

# Install profiles

install_base(){
    install_pkg_list "base/pre_install.list"

    log_progress "Installing Oh My Zsh"
    if [[ -f "$OPT_TARGET_DIR/.zshrc" ]]; then
        log_err "Error: Existing .zshrc found, please remove it before continuing"
        exit 1
    fi

    ZSH=$(join_path $OPT_TARGET_DIR ".oh-my-zsh") \
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh) \
        --keep-zshrc --unattended"
    rm -f $(join_path $OPT_TARGET_DIR ".zshrc")

    log_progress "Linking dotfiles"
    link

    # TODO: Make this portable
    if is_platform "linux" "archlinux"; then
        log_progress "Enabling SSH agent"
        # FIXME: Make this respect $OPT_TARGET_DIR
        systemctl enable --user ssh-agent.service
    fi

    log_progress "Installing powerlevel10k"
    git clone https://github.com/romkatv/powerlevel10k.git \
        $OPT_TARGET_DIR/.oh-my-zsh/custom/themes/powerlevel10k

    # Install ZSH plugins
    mkdircd $(join_path $OPT_TARGET_DIR ".oh-my-zsh/custom/plugins")
    read_list_file $(join_path $DOTFILES_ROOT_DIR "$DOTFILES_SETUP_DIR/zsh_plugins.list")
    for plugin in "${list_file_data[@]}"; do
        local plugin_name=$(echo -n $plugin | sed 's/^.*\///')
        log_progress "Installing ZSH plugin: $plugin_name"
        git clone "$plugin"
    done
    cd -

    log_progress "Changing user's default shell"
    chsh -s $(which zsh) $(whoami)

    install_pkg_list "base/install.list"

    log_progress "Installing tmux plugin manager"
    mkdircd $(join_path $OPT_TARGET_DIR ".local/share/tmux/plugins")
    git clone https://github.com/tmux-plugins/tpm
    cd -

    # Install rust packages
    #rustup toolchain install stable

    log_progress "Installing neovim python module"
    pip3 install neovim

    log_progress "Installing neovim CoC extensions"
    cd $(join_path $OPT_TARGET_DIR ".config/coc/extensions")
    npm install --ignore-scripts --no-lockfile --production --legacy-peer-deps
    cd -

    log_progress "Installing neovim packer"
    mkdircd $(join_path $OPT_TARGET_DIR ".local/share/nvim/site/pack/packer/start")
    git clone https://github.com/wbthomason/packer.nvim
    cd -

    log_progress "Installing neovim plugins"
    nvim -u $(join_path $OPT_TARGET_DIR ".config/nvim/lua/plugins.lua") --noplugin \
        -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}

install_desktop(){
    install_pkg_list "desktop/install.list"

    if is_platform "linux" "archlinux"; then
        log_progress "Setting up ly login manager"
        sudo systemctl enable ly
    fi
}

install_extra(){
    install_pkg_list "extra/install.list"

    log_progress "Setting up mpv"
    # Link yt-dlp into mpv directory
    ln -s $(which yt-dlp) $(join_path $OPT_TARGET_DIR ".config/mpv/youtube-dl")
}

# Actions

link(){
    gate_binaries "${REQUIRED_BINARIES[@]}"
    log_header "Symlinking dotfiles..."
    hook_pre_link
    for dir in "${DOTFILE_DIRS[@]}"; do
        log "+ Linking \"$dir\""
        run_cmd "stow $STOWFLAGS $dir"
    done
    hook_post_link
    log_success "Symlink successful"
}

unlink(){
    gate_binaries "${REQUIRED_BINARIES[@]}"
    log_header "Removing symlinks to dotfiles..."
    hook_pre_unlink
    for dir in "${DOTFILE_DIRS[@]}"; do
        log "- Unlinking \"$dir\""
        run_cmd "stow -D $STOWFLAGS $dir"
    done
    hook_post_unlink
    log_success "Unlink successful"
}

relink(){
    gate_binaries "${REQUIRED_BINARIES[@]}"
    log_header "Relinking dotfiles..."
    for dir in "${DOTFILE_DIRS[@]}"; do
        log "> Relinking \"$dir\""
        run_cmd "stow -R $STOWFLAGS $dir"
    done
    log_success "Relink successful"
}

install(){
    gate_os strict "Package install cannot proceed."
    gate_binaries "${REQUIRED_BINARIES[@]}" "${REQUIRED_INSTALL_BINARIES[@]}"

    if [[ $OPT_DRY_RUN == 1 ]]; then
        log_err "Error: \"install\" cannot run when dry-run is enabled"
        exit 1
    fi

    while [[ $# -gt 0 ]]; do
        local profile=$1
        if [[ $# -lt 1 ]]; then
            log_err "Error: Install profiles needed to be specified"
            log_err "See $0 --help for avaliable profiles."
            exit 1
        fi

        shift
        case "$profile" in
            base)
                log_header "Installing base packages"
                install_base
                log_success "Base packages install successful"
            ;;
            desktop)
                log_header "Installing desktop packages"
                install_desktop
                log_success "Desktop packages install successful"
            ;;
            extra)
                log_header "Installing extra packages"
                install_extra
                log_success "Extra packages install successful"
            ;;
            # TODO: Add server profile
            *)
                log_err "Error: Invalid install profile \"$profile\""
                exit 1
            ;;
        esac
    done
    log_success "All selected packages has been successfully installed and configured"
}

clean(){
    local find_exclude=""
    for item in "${STOW_EXCLUDE[@]}"; do
        find_exclude+="-not -name $item "
    done

    local clean_files=()
    for dir in "${DOTFILE_DIRS[@]}"; do
        cd $dir
        for file in $(find . -type f $find_exclude); do
            local filename="$OPT_TARGET_DIR$(echo $file | sed 's/^.//')"
            log_dbg "Checking: $filename"
            if [[ -f "$filename" ]] && [[ ! -L "$filename" ]] && ! file_is_in_symlink "$filename"; then
                clean_files+=("$filename")
            fi
        done
        cd ..
    done

    # Clean extra files
    for item in "${CLEAN_EXTRA_ITEMS}"; do
        if [[ -f $(join_path $OPT_TARGET_DIR "$item") ]]; then
            clean_files+=($(join_path $OPT_TARGET_DIR $item))
        fi
    done

    log_dbg "Files to be cleaned: ${clean_files[@]}"

    if [[ "${#clean_files[@]}" == "0" ]]; then
        echo "Your target directory is already clean."
        exit 0
    fi

    log_warn "Warning: \"clean\" will destructively delete the following files:"
    log_warn
    for file in "${clean_files[@]}"; do
        log_warn "[!] $file"
    done

    log
    if [[ $OPT_DRY_RUN == 1 ]]; then
        log -n "Dry-run will simulate file deletion."
    else
        log -n "${BOLD_COLOR}Deleted files cannot be recovered!${RESET_COLOR}"
    fi
    read -p " Continue? [y/N] " -n 1 -r
    log

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        for file in "${clean_files[@]}"; do
            echo "Cleaning \"$file\"..."
            run_cmd rm -f "$file"
        done
        log_success "Target directory cleaned"
    else
        log_err "Aborting."
        exit 1
    fi
}

# Entry
set -e
log_dbg "$0 ran from \"$DOTFILES_ROOT_DIR\""

# Process flags
args=()
args_count=0

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            print_help
            exit
        ;;
        -t)
            shift
            OPT_TARGET_DIR=$(join_path $DOTFILES_ROOT_DIR $1)
            log_dbg "OPT_TARGET_DIR set: -t -> $OPT_TARGET_DIR"
            shift
        ;;
        --target=?*)
            OPT_TARGET_DIR=$(join_path $DOTFILES_ROOT_DIR ${1#--target=})
            log_dbg "OPT_TARGET_DIR set: --target= -> $OPT_TARGET_DIR"
            shift
        ;;
        -d|--dry-run)
            OPT_DRY_RUN=1
            shift
        ;;
        # TODO: Make expert able to skip some checks, eg. use pacman instead of yay
        --expert)
            OPT_EXPERT=1
            shift
        ;;
        # TODO: Add --deep for cleaning symlinks
        -*|--*)
            log_err "Error: Unknown option \"$1\""
            log_err "See $0 --help for avaliable options."
            exit 1
        ;;
        *)
            args+=("$1") # save positional arg
            let "args_count+=1"
            shift
        ;;
    esac
done

log_dbg "Received $args_count arguments: \"${args[@]}\""
set -- "${args[@]}" # restore positional parameters

if [[ args_count -lt 1 ]]; then
    print_help
    log_dbg "Exiting with error because no action"
    exit 1
fi

# Process action
action=$1
shift
log_dbg "Processing action: \"$action\""

detect_os
log_dbg "OS detected as: $DETECTED_OS $DETECTED_OS_VARIANT"

build_stowflags
log_dbg "STOWFLAGS built: $STOWFLAGS"

case $action in
    link) link ;;
    unlink) unlink ;;
    relink) relink ;;
    install) install $* ;;
    clean) clean ;;
    *)
        log_err "Error: Unknown action \"$action\""
        log_err "See $0 --help for avaliable actions."
        exit 1
    ;;
esac
