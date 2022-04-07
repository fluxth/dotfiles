export GPG_TTY=$(tty)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Current theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# oh-my-zsh plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
    zsh-vim-mode
    zsh-completions
    zsh-abbr
)

source $ZSH/oh-my-zsh.sh

# User configuration
KEYTIMEOUT=1

ZSH_AUTOSUGGEST_STRATEGY=(history completion)

bindkey '^ ' autosuggest-accept
bindkey '^X' autosuggest-clear

# export MANPATH="/usr/local/man:$MANPATH"
### Fix slowness of pastes with zsh-syntax-highlighting.zsh
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes

# Language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'
export MANPAGER='nvim +Man!'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Alieses
if [[ ! -z "$TMUX" ]]; then
    alias fzf="fzf-tmux"
fi
PROJECTS_PATH=$HOME/work/repo
alias pj='cd "$PROJECTS_PATH/"$(ls $PROJECTS_PATH | fzf)'

# Platform dependent configurations
export ENV_UNAME=$(uname)
export ENV_ARCH=$(uname -m)
if [[ "$ENV_UNAME" == "Darwin" ]]; then
    source "$XDG_CONFIG_HOME/zsh/macos.zsh"
elif [[ "$ENV_UNAME" == "Linux" ]]; then
    source "$XDG_CONFIG_HOME/zsh/linux.zsh"
fi

# PATH configuration
export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# Load powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

TERM_CLEAR='\033[0m'
TERM_BOLD='\033[1m'
TERM_UNDL='\033[4m'

TERM_RED='\033[31m'
TERM_YELLOW='\033[33m'
TERM_VIOLET='\033[35m'
TERM_BEIGE='\033[36m'
TERM_WHITE='\033[37m'

echo "$TERM_YELLOW$TERM_BOLD$TERM_UNDL$(uname -n)$TERM_CLEAR ${TERM_WHITE}[$(uname -sr)]$TERM_CLEAR"
echo " $TERM_YELLOW└$TERM_CLEAR $TERM_RED$(whoami)$TERM_CLEAR $TERM_VIOLET@$TERM_CLEAR $TERM_BEIGE$TTY$TERM_CLEAR\n"
