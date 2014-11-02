# .bashrc
if [ -n "$SSH_CLIENT" ]; then
  # change colors in ssh
	PS1='\[\e[0;34m\]\w\[\e[m\] \[\e[0;32m\]\$\[\e[m\] '
else
	# PS1='\[\e[0;34m\]\w\[\e[m\] \[\e[0;32m\]\$\[\e[m\] '
  PS1='\[\e[0;34m\]\w $(vcprompt -f "[%b%m]") \[\e[0;32m\]\$\[\e[m\] '
fi

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
alias pacman='sudo pacman'
alias please='sudo '
alias ls='ls -hF --color'
alias ll='ls -l --group-directories-first'
alias la='ls -Al'
alias lock='slimlock'
alias unmount='udiskie-umount -a'
alias valgrind='valgrind --leak-check=yes'
alias extract='dtrx'
#alias winesteam='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe -no-dwrite >/dev/null 2>&1 &'
#alias sleep='systemctl suspend'
#alias runcube='( python cubebot.py &> log.txt ) &'

alias git='hub'
alias gits='git status -uno' 						   # hides files not added to the repo
alias tmux='tmux -2 -u' 							   # 256 color and utf-8
alias sprunge='curl -F "sprunge=<-" http://sprunge.us' # paste code to web w/ sprunge

alias antlr4='java -jar /usr/local/lib/antlr-4.4-complete.jar'
alias grun='java org.antlr.v4.runtime.misc.TestRig'

# ignore some files
FIGNORE=".o"

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

export TERM='xterm-256color'

#export REPOSITORY=$HOME/nupic
export NUPIC=$HOME/nupic
export NTA=$NUPIC/build/release
export NTA_ROOTDIR=$NTA
export PYTHONPATH=$PYTHONPATH:$NTA/lib/python2.7/site-packages

export python='python2'

# colorful manpages
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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#set wallpaper
feh --bg-scale /home/viraj/Pictures/whaleclouds.jpg
