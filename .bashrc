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

## Ignore history for certain commands
HISTIGNORE='ls:ll:bg:fg:history'

HISTSIZE=200000
HISTFILESIZE=200000

# Dump history right away and setup the shell prompt
PROMPT_COMMAND='history -a && set_prompt'

# Aliases
alias grep='grep --color=auto'
alias ll='ls -lahG'

# Functions
function set_prompt () {

	    # Get return code of last command to put at front of prompt
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

        ### Handle last command exit code ###
		if [[ ${LAST_COMMAND} == 0 ]]; then
		   PS1+="${GREEN}${CHECKMARK} "
		else
		   PS1+="${WHITE}\$? ${RED}${FANCY_X} "
        fi

		### Start with square bracket ###
		PS1+="${WHITE}["

		# If not successful, print last commands return code and a red X.
		if [[ ${LAST_COMMAND} != 0 ]]; then
			PS1+="${WHITE}\$? ${RED}${FANCY_X} "
		fi

		# If root, print the user in red.
		# Otherwise, print the current user in yellow.
		local USERNAME_COLOR=${YELLOW}
		if [[ ${EUID} == 0 ]]; then
			USERNAME_COLOR="${BOLD_RED}"
		fi

		PS1+="${USERNAME_COLOR}\\u${WHITE}@"

		# Print the short hostname
		PS1+="${GREEN}\\h${WHITE}: "

		# Add the git branch you are working on if in a git repo
		BRANCH="$(git branch 2>/dev/null | sed -n 's/* \(.*\)/\1/p')"
		if [[ ! -z "${BRANCH}" ]]; then
			PS1+="${PURPLE}(${BRANCH}) "
		fi

		# Add the python virtual environment you are working on if in a python virtual environment
		if [[ ${VIRTUAL_ENV} ]]; then
			PS1+="${YELLOW}{$(echo ${VIRTUAL_ENV} | sed -n 's/.*\/\(.*\)/\1/p')} "
		fi

		# Print the working directory in teal
		PS1+="${TEAL}\\w "

		# End prompt with a square bracket
		PS1+="${WHITE}]\n"

		# Print the prompt marker in green
		# and reset the text color to the default.
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


source ~/.local/git-auto-complete.bash
