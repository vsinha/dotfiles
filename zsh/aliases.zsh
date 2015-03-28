# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'
alias ll='ls -GFhl'
alias la='ls -GFhlA'
alias grep='grep --color=always'

alias todo="vim ~/Documents/todo.txt"

# directory movement
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias 'bk=cd $OLDPWD'

# servers
alias valhalla='ssh viraj@valhalla.vsinha.com'

# git
alias gits='git status -uno'  # hides files not added to the repo
alias gitl='git log --graph --full-history --all --pretty=format:"%h%x09%d%x20%s"'
alias gitb='git branch -l'

alias vim='mvim -v'
alias vimrc='vim ~/.vimrc'

alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport

# xcode
alias purgeallbuilds='rm -rf ~/library/Developer/Xcode/DerivedData/*'

# hadoop
alias hstart="/usr/local/Cellar/hadoop/2.6.0/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.6.0/sbin/start-yarn.sh"
alias hstop="/usr/local/Cellar/hadoop/2.6.0/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.6.0/sbin/stop-dfs.sh"

#edit zshell things
alias zalias="vim ~/dotfiles/zsh/aliases.zsh"
alias zexports="vim ~/dotfiles/zsh/exports.zsh"

stream() {
    peerflix $1 --vlc
}
