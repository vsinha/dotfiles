# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'
alias ll='ls -GFhl'
alias la='ls -GFhlA'

# directory movement
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias 'bk=cd $OLDPWD'

# servers
alias valhalla='ssh viraj@valhalla.vsinha.com'
alias olympus='ssh viraj@olympus.vsinha.com'

# git
alias gits='git status -uno'  # hides files not added to the repo
alias gitl='git log --graph --full-history --all --pretty=format:"%h%x09%d%x20%s"'
alias gitb='git branch -l'

alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport
