# .bashrc
PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;32m\]\$\[\e[m\] '

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias vi='vim'
alias pacman='pacman-color'
alias p='sudo packer'
alias grep='grep -n --color-auto'
alias ll='ls -l --group-directories-first'
alias ls='ls -hF --color'
alias la='ls -Al'
alias lock='slimlock'
alias suspend='sudo pm-suspend'
alias unmount='udiskie-umount -a'
alias midgard='ssh 10.10.1.7'
alias valgrind='valgrind --leak-check=yes'

# bash_history settings
shopt -s histappend
unset HISTFILESIZE
HISTSIZE=1000000
export HISTCONTROL=ignoreboth

# disable ^C echo
set echo-control-characters off

# export some system variables
export TERM=rxvt-unicode-256color
export LD_LIBRARY_PATH=/opt/AftershotPro/lib:$LD_LIBRARY_PATH
export PATH=/home/viraj/bin:$PATH

# autocompletes
complete -cf sudo
complete -cf man

# bash history completion, bound to down and up arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# colored manpages
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}
