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
#alias ll='exa -l --header --icons'

# rust btw
alias ls='exa'
alias cat='bat'
alias ps='procs'

exa() {
    if [[ "$#" -gt 0 ]]; then
        command exa --icons "$@"
    else
        command exa "$@"
    fi
}

#exa() {
#    if [[ "$1" == "-l" ]]; then
#        command exa --icons "$@"
#    elif [[ "$1" == "-a" ]]; then
#        command exa --icons "$@"
#    elif [[ "$1" == "-la" ]]; then
#        command exa --icons "$@"
#    else
#        command exa "$@"
#    fi 
#}

# number of positional arguments in bash
# ${#} or $#

# expands to current option flags
# $-


eval "$(starship init bash)"

eval "$(zellij setup --generate-auto-start bash)"
