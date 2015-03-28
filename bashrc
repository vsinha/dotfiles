# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

#if [ -f `brew --prefix`/etc/bash_completion ]; then
#      . `brew --prefix`/etc/bash_completion
#fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

PS1='\[\e[0;34m\]\w $(vcprompt -f "[%b%m]") \[\e[0;32m\]\$\[\e[m\] '
#PS1='\[\e[0;34m\]\w \[\e[0;32m\]\$\[\e[m\] '

if [ -d ~/z ]; then
    # else clone https://github.com/rupa/z to ~/
  . ~/z/z.sh
fi


#precmd() {
  # sets the tab title to current dir
#  echo -ne "\e]1;${PWD##*/}\a"
#}


#if [ $ITERM_SESSION_ID ]; then
#  export PROMPT_COMMAND='echo -ne "\033];${PWD##*/}\007"; ':"$PROMPT_COMMAND";
#fi

# User specific aliases and functions
alias ls='ls -hFGp ' #--color'
alias ll='ls -l'
alias la='ls -Al'

alias valgrind='valgrind --leak-check=yes'
alias extract='dtrx'
alias valhalla='ssh viraj@valhalla.vsinha.com'
alias olympus='ssh viraj@olympus.vsinha.com'
alias vimrc='vim ~/.vimrc'
#alias winesteam='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/Steam/Steam.exe -no-dwrite >/dev/null 2>&1 &'
#alias sleep='systemctl suspend'
#alias runcube='( python cubebot.py &> log.txt ) &'
alias git=hub
alias gits='git status -uno'  # hides files not added to the repo
alias gitl='git log --graph --full-history --all --pretty=format:"%h%x09%d%x20%s"'
alias gitb='git branch -l'
alias tmux='tmux -2 -u'       # 256 color and utf-8
alias sprunge='curl -F "sprunge=<-" http://sprunge.us' # paste code to web w/ sprunge

alias purgeallbuilds='rm -rf ~/library/Developer/Xcode/DerivedData/*'

# ignore some files
FIGNORE=".o"

# bash_history settings
shopt -s histappend
unset HISTFILESIZE
HISTSIZE=1000000
export HISTCONTROL=ignoreboth


# disable ^C echo
#set echo-control-characters off

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

#export TERM='xterm-256color'

#export REPOSITORY=$HOME/nupic
#export NUPIC=$HOME/nupic
#export NTA=$NUPIC/build/release
#export NTA_ROOTDIR=$NTA
#export PYTHONPATH=$PYTHONPATH:$NTA/lib/python2.7/site-packages

#export python='python2'

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

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
