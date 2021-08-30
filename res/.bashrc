### Global bashrc ###
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

### Locale ###
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

### Umask ###
umask 002

### Enable ** glob ###
if [ -o globstar ]; then
	  shopt -s globstar
fi

### Append to history rather than overwrite ###
shopt -s histappend

### Commands to ignore in history ###
HISTIGNORE='ls:ll:bg:fg:history'

### History size ###
HISTSIZE=200000
HISTFILESIZE=200000

### Command for prompt ###
PROMPT_COMMAND='set_prompt'

### Command aliases ###
alias grep='grep --color=auto'
alias ll='ls -lah'

function set_prompt () {

    ### Return code of previous command ###
    local LAST_COMMAND=$?

    ### Define colors ###
    local BOLD_BLUE='\[\e[01;34m\]'
    local BOLD_GREEN='\[\e[01;32m\]'
    local BOLD_PURPLE='\[\e[01;35m\]'
    local BOLD_RED='\[\e[01;31m\]'
    local BOLD_TEAL='\[\e[01;36m\]'
    local BOLD_WHITE='\[\e[01;37m\]'
    local BOLD_YELLOW='\[\e[01;33m\]'
    local BLUE='\[\e[00;34m\]'
    local GREEN='\[\e[00;32m\]'
    local PURPLE='\[\e[00;35m\]'
    local RED='\[\e[00;31m\]'
    local RESET='\[\e[00m\]'
    local TEAL='\[\e[00;36m\]'
    local WHITE='\[\e[00;37m\]'
    local YELLOW='\[\e[00;33m\]'

    ### Define special symbols ###
    local CHECKMARK='\342\234\223'
    local FANCY_X='\342\234\227'

    ### Clear prompt ###
    PS1=""

    ### Start with square bracket ###
    PS1+="${WHITE}["

    ### Handle last command exit code ###
    if [[ ${LAST_COMMAND} == 0 ]]; then
        PS1+=" ${GREEN}${CHECKMARK} "
    else
        PS1+=" ${RED}${FANCY_X} "
    fi

    ### If root, print the user in red ###
    local USERNAME_COLOR=${YELLOW}
    if [[ ${EUID} == 0 ]]; then
        USERNAME_COLOR="${BOLD_RED}"
    fi

    ### Otherwise, print the current user in yellow ###
    PS1+="${USERNAME_COLOR}\\u${WHITE}@"

    ### Hostname ###
    PS1+="${GREEN}\\h${WHITE}: "

    ### Git branch if in repo ###
    BRANCH="$(git branch 2>/dev/null | sed -n 's/* \(.*\)/\1/p')"
    if [[ ! -z "${BRANCH}" ]]; then
        PS1+="${PURPLE}(${BRANCH}) "
    fi

    ### Python virtual environment ###
    if [[ ${VIRTUAL_ENV} ]]; then
        PS1+="${YELLOW}{$(echo ${VIRTUAL_ENV} | sed -n 's/.*\/\(.*\)/\1/p')} "
    fi

    ### Current working directory ###
    PS1+="${TEAL}\\w "

    ### End with square bracket ###
    PS1+="${WHITE}]\n"

    ### Prompt marker and reset color ###
    PS1+="${GREEN}\\\$${RESET} "
}

### User local executibles ###
export PATH=$HOME/.local/bin:$PATH

### MacOS specific config ###
if [ "`uname`" == "Darwin" ]; then
    ### Ignore zsh message ###
    export BASH_SILENCE_DEPRECATION_WARNING=1

    ### `code` command for MacOS ###
    alias code='open -a Visual\ Studio\ Code'
fi

### Git autocomplete ###
source ~/.local/git-auto-complete.bash