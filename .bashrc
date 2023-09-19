# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !


# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Put your fun stuff here.

complete -cf doas

HISTSIZE=2000
HISTFILESIZE=3000

alias vi='nvim .'
alias nn='nvim'
alias flameshot='flameshot gui'

# alias ls='ls --color=auto'
#alias ll='eza -l --header --icons'

# rust btw
alias ls='eza'
alias cat='bat'
alias ps='procs'

eza() {
    if [[ "$#" -gt 0 ]]; then
        command eza --icons "$@"
    else
        command eza "$@"
    fi
}

#eza() {
#    if [[ "$1" == "-l" ]]; then
#        command eza --icons "$@"
#    elif [[ "$1" == "-a" ]]; then
#        command eza --icons "$@"
#    elif [[ "$1" == "-la" ]]; then
#        command eza --icons "$@"
#    else
#        command eza "$@"
#    fi 
#}

# number of positional arguments in bash
# ${#} or $#

# expands to current option flags
# $-


eval "$(starship init bash)"

eval "$(zellij setup --generate-auto-start bash)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/nic/google-cloud-sdk/path.bash.inc' ]; then . '/home/nic/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/nic/google-cloud-sdk/completion.bash.inc' ]; then . '/home/nic/google-cloud-sdk/completion.bash.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
