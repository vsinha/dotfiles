# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f `brew --prefix`/etc/bash_completion.d/git-prompt.sh ]; then
  . `brew --prefix`/etc/bash_completion.d/git-prompt.sh
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# .bashrc
if [ -n "$SSH_CLIENT" ]; then
	PS1='\[\e[0;32m\]\u@\[\e[m\]\[\e[0;33m\]\h\[\e[m\] \[\e[0;34m\]\w\[\e[m\] \[\e[0;32m\]\$\[\e[m\] '
else
  PS1='\[\e[0;34m\]\w $(__git_ps1 "(%s)")\[\e[m\] \[\e[0;32m\]\$\[\e[m\] '
fi

# User specific aliases and functions
alias ls='ls -hG'
alias ll='ls -l'
alias la='ls -Al'
alias lock='slimlock'
alias unmount='udiskie-umount -a'
alias valgrind='valgrind --leak-check=yes'
alias extract='dtrx'
alias git=hub
alias gits='git status -uno'  # hides files not added to the repo
alias gitl='git log --graph --full-history --all --pretty=format:"%h%x09%d%x20%s"'
alias tmux='tmux -2 -u'       # 256 color and utf-8
alias sprunge='curl -F "sprunge=<-" http://sprunge.us' # paste code to web w/ sprunge

# ignore some files
FIGNORE=".o"

# bash_history settings
shopt -s histappend
unset HISTFILESIZE
HISTSIZE=1000000
export HISTCONTROL=ignoreboth

export PATH=/Users/vjsinha/Library/Python/2.7/bin:/Users/vjsinha/bin:/Users/vjsinha/.gem/ruby/1.9.1/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin


# disable ^C echo
set echo-control-characters off

export EDITOR="/usr/bin/vim"

# autocompletes
complete -cf sudo
complete -cf man

# git command line autocompletion
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

# bash history completion, bound to down and up arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on

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

# nupic env
export NUPIC=/Users/vjsinha/nta/nupic
export NTA=$NUPIC/build/release
export PYTHONPATH=$PYTHONPATH:$NTA/lib/python2.7/site-packages
