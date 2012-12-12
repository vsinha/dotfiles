# .bashrc
PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;32m\]\$\[\e[m\] '

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias vi='vim'

alias pacman='pacman-color'
alias pacin='sudo pacman-color -S'

alias ll='ls -l --group-directories-first'
alias ls='ls -hF --color'
alias la='ls -Al'

alias lock='slimlock'
alias suspend='sudo pm-suspend'

alias unmount='udiskie-umount -a'

alias midgard='ssh 10.10.1.7'


###### ECE 264 ######
alias valgrind='valgrind --leak-check=yes'


#----bash_history settings
shopt -s histappend
unset HISTFILESIZE
HISTSIZE=1000000

export HISTCONTROL=ignoreboth

# disable ^C echo
set echo-control-characters off

export TERM=rxvt-unicode-256color
export LD_LIBRARY_PATH=/opt/AftershotPro/lib:$LD_LIBRARY_PATH
export PATH=/home/viraj/bin:$PATH
