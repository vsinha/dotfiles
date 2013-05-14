# .bashrc
if [ -n "$SSH_CLIENT" ]; then
	PS1='\[\e[0;32m\]\u@\[\e[m\]\[\e[0;33m\]\h\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;32m\]\$\[\e[m\] '
else
	PS1='\[\e[0;32m\]\u@\h\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;32m\]\$\[\e[m\] '
fi


# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
#alias vi='vim' # need to get out of this habit
alias pacman='sudo pacman'
alias please='sudo '
alias vi='echo "I think you mean vim"'
alias ll='ls -l --group-directories-first'
alias ls='ls -hF --color'
alias la='ls -Al'
alias lock='slimlock'
alias unmount='udiskie-umount -a'

alias asgard ='ssh virajs.in'
alias midgard='ssh 10.10.1.7'

alias valgrind='valgrind --leak-check=yes'
alias extract='dtrx'

alias winesteam='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe -no-dwrite >/dev/null 2>&1 &'

alias sleep='systemctl suspend'

# bash_history settings
shopt -s histappend
unset HISTFILESIZE
HISTSIZE=1000000
export HISTCONTROL=ignoreboth

# disable ^C echo
set echo-control-characters off

# export some system variables
export LD_LIBRARY_PATH=/opt/AftershotPro/lib:$LD_LIBRARY_PATH
export PATH=$HOME/bin:$HOME/.gem/ruby/1.9.1/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:$PATH
export CLASSPATH="$CLASSPATH:$HOME/.lein/self-installs/leiningen-2.0.0-preview10-standalone.jar"
export EDITOR="/usr/bin/vim"

# autocompletes
complete -cf sudo
complete -cf man

# bash history completion, bound to down and up arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on

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
