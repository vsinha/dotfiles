# Currently this path is appendend to dynamically when picking a ruby version
#export PATH=bin:script:~/.rbenv/bin:~/.bin:node_modules/.bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:~/.cabal/bin:$HOME/Library/Haskell/bin:$PATH
#export PATH=/Users/viraj/.gem/bin:bin:script:~/.bin:node_modules/.bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:$PATH

#PATH=~/.cabal/bin:$PATH
#export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
#export PATH=$PATH:/usr/local/opt/go/libexec/bin
#export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH
#include the homebrew GNU coreutils rather than the BSD OSX ones
#export PATH=$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH

export GOPATH=$HOME/dev/go/

####
export PATH="\
bin:script:node_modules/.bin\
:$HOME/.bin:$HOME/.gem/bin:$HOME/.pyenv/bin:$HOME/.pyenv/shims:$HOME/.opam/system/bin:$HOME/.rvm/bin:$HOME/Library/Haskell/bin:$HOME/bin\
:$HOME/.gem/ruby/2.2.0/bin\
:$GOPATH/bin\
:/Applications/Postgres.app/Contents/Versions/9.3/bin\
:/usr/local/opt/go/libexec/bin:/usr/local/share/npm/bin:/usr/local/MacGPG2/bin:/usr/local/sbin:/usr/local/bin\
:/usr/texbin:/usr/sbin:/usr/bin:/opt/X11/bin:/sbin:/bin"
#:$(brew --prefix coreutils)/libexec/gnubin"
#####

#export PATH=bin:script:node_modules/.bin
#export PATH=$PATH:$HOME/.bin:$HOME/.gem/bin:$HOME/.pyenv/bin:$HOME/.pyenv/shims:$HOME/.opam/system/bin:$HOME/.rvm/#bin:$HOME/Library/Haskell/bin:$HOME/bin
#export PATH=$PATH:$GOPATH/bin
#export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.3/bin
#export PATH=$PATH:/usr/local/opt/go/libexec/bin:/usr/local/share/npm/bin:/usr/local/MacGPG2/bin:/usr/local/sbin:/#usr/local/bin
#export PATH=$PATH:/usr/texbin:/usr/sbin:/usr/bin:/opt/X11/bin:/sbin:/bin

# since this uses `brew`, it has to be after /usr/local/bin
#export PATH=$PATH:$(brew --prefix coreutils)/libexec/gnubin

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 


export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Set default console Java to 1.6
#export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_13.jdk/Contents/Home
#export ANDROID_SDK_ROOT=/opt/boxen/homebrew/opt/android-sdk

# Setup terminal, and turn on colors
export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
#export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

export LESS='--ignore-case --raw-control-chars'
#export PAGER='most'
#export EDITOR='/Applications/MacVim.app/Contents/MacOS/Vim'
export EDITOR=`which vim`
#export NODE_PATH=/opt/boxen/nodenv/versions/v0.10/lib
#export PYTHONPATH=/usr/local/lib/python2.7/site-packages
#Point OSX to Cellar python 
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
# CTAGS Sorting in VIM/Emacs is better behaved with this in place

export LC_COLLATE=C
export LC_ALL=en_US.UTF-8


# opam stuff
export OPAMJOBS=4

export WORKON_HOME=~/.virtualenvs

