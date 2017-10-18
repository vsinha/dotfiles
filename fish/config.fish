# Path to Oh My Fish install.
set -gx OMF_PATH "/Users/viraj/.local/share/omf"

# Customize Oh My Fish configuration path.
set -gx OMF_CONFIG "/Users/viraj/.config/omf"

# Path to z
set -g Z_SCRIPT_PATH z

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

alias ls='ls -lhFG'
alias ll='exa -l'

#alias ll='ls -ahlF'
#alias l='ls -CF'

# below is borrowed from here: https://github.com/yangchenyun/fish-config/blob/master/functions/aliases.fish

alias ..="cd .."
alias ...="cd ../.."
#alias -="cd -"

alias la="ls -Gla"

# List only directories
alias lsd='ls -l | grep "^d"'

# git
alias git='hub'
alias gits='git status -uno'  # hides files not added to the repo
alias gitl='git log --graph --full-history --all --pretty=format:"%h%x09%d%x20%s"'
alias gitb='git branch -l'
alias gpo='git push origin'
alias gpom='git push origin master'
alias gs='git status'
alias gc='git commit'
alias gcm='git commit -m'
alias ga='git add'

#alias vim='env DYLD_FORCE_FLAT_NAMESPACE=1 mvim -v'
alias vimrc='vim ~/.vimrc'
#export EDITOR='DYLD_FORCE_FLAT_NAMESPACE=1 mvim -v'

function vim --wraps "vim"
    mvim -v $argv
end

alias v='f -e vim' # quick opening files with vim
alias top="vtop"
alias oldtop="/usr/bin/top"


# path to the DCOS CLI binary
#set PATH /Users/viraj/dev/msft/dcos/bin $PATH
#set PATH /Users/viraj/.go/bin $PATH

set PATH /Users/viraj/bin $PATH

# path to conda
# added by Anaconda3 4.4.0 installer
#set PATH /Users/viraj/anaconda/bin $PATH
#set PATH /Users/viraj/miniconda3/bin $PATH
#source (conda info --root)/bin/conda.fish
#source (conda info --root)/etc/fish/conf.d/conda.fish


################################
###  File ShortCut
################################
alias msft="cd ~/dev/msft"
alias g="git"
alias v="mvim -v"
alias vim="mvim -v"
alias s="sublime"

################################
###  Program ShortCut
################################

# git related shortcut
alias undopush="git push -f origin HEAD^:master"
#alias gd="git diff"
#alias gdc="git diff --cached"
#alias ga="git add"
#alias gca="git commit -a -m"
#alias gcm="git commit -m"
#alias gbd="git branch -D"
#alias gst="git status -sb --ignore-submodules"
#alias gm="git merge --no-ff"
#alias gpt="git push --tags"
#alias gp="git push"
#alias grs="git reset --soft"
#alias grh="git reset --hard"
#alias gb="git branch"
#alias gcob="git checkout -b"
#alias gco="git checkout"
#alias gba="git branch -a"
#alias gcp="git cherry-pick"
#alias gl="git lg"
#alias gpom="git pull origin master"
# turn on coloring on grep
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Quick check running state of a process
alias psef="ps -ef | peco "
alias top="top -o cpu"

# from http://news.ycombinator.com/item?id=4492682
function tree1; tree --dirsfirst -ChFLQ 1 $argv; end
function tree2; tree --dirsfirst -ChFLQ 2 $argv; end
function tree3; tree --dirsfirst -ChFLQ 3 $argv; end
function tree4; tree --dirsfirst -ChFLQ 4 $argv; end
function tree5; tree --dirsfirst -ChFLQ 5 $argv; end
function tree6; tree --dirsfirst -ChFLQ 6 $argv; end

################################
###  I am an Idiot
################################
# Stuff I never really use but cannot delete either because of http://xkcd.com/530/
alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"

set PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH

set -xU OPENSSL_INCLUDE_DIR "/usr/local/opt/openssl/include"
set -xU OPENSSL_LIB_DIR "/usr/local/opt/openssl/lib"
