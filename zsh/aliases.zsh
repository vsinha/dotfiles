# Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -GFh'
alias ll='ls -GFhl'
alias la='ls -GFhlA'
alias grep='grep --color=always'

# grep folder recursively
gf() {
    grep -nr $1 --exclude-dir "*node_modules*" .
}

tern-generate() {
    cat << EOF > .tern-project
{
  "plugins": {
    "node": {}
  }
}
EOF
}

alias todo="vim ~/Documents/todo.txt"

# directory movement
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias 'bk=cd $OLDPWD'

# servers
alias valhalla='ssh viraj@valhalla.vsinha.com'

# git
eval "$(hub alias -s)" # hub helps you win at git
alias gits='git status -uno'  # hides files not added to the repo
alias gitl='git log --graph --full-history --all --pretty=format:"%h%x09%d%x20%s"'
alias gitb='git branch -l'

alias vim='DYLD_FORCE_FLAT_NAMESPACE=1 mvim -v'
alias vimrc='vim ~/.vimrc'
export EDITOR='DYLD_FORCE_FLAT_NAMESPACE=1 mvim -v'

alias airport=/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport

# xcode
alias purgeallbuilds='rm -rf ~/library/Developer/Xcode/DerivedData/*'

# hadoop
alias hstart="/usr/local/Cellar/hadoop/2.6.0/sbin/start-dfs.sh;/usr/local/Cellar/hadoop/2.6.0/sbin/start-yarn.sh"
alias hstop="/usr/local/Cellar/hadoop/2.6.0/sbin/stop-yarn.sh;/usr/local/Cellar/hadoop/2.6.0/sbin/stop-dfs.sh"

#edit zshell things
alias zshrc="vim ~/.zshrc"
alias zalias="vim ~/dotfiles/zsh/aliases.zsh"
alias zexports="vim ~/dotfiles/zsh/exports.zsh"
alias zsource="source ~/.zshrc"

#alias d="cd ~/wire/down-server && workon down-env"

stream() {
    peerflix $1 --vlc
}

alias quote='nc pchs.co 17'
