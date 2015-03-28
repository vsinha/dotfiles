# Currently this path is appendend to dynamically when picking a ruby version
#export PATH=bin:script:~/.rbenv/bin:~/.bin:node_modules/.bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:~/.cabal/bin:$HOME/Library/Haskell/bin:$PATH
export PATH=/Users/viraj/.gem/bin:bin:script:~/.bin:node_modules/.bin:/usr/local/sbin:/usr/local/bin:/usr/local/share/npm/bin:$PATH

export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=/Applications/Postgres.app/Contents/Versions/9.3/bin:$PATH

#include the homebrew GNU coreutils rather than the BSD OSX ones
export PATH=$(brew --prefix coreutils)/libexec/gnubin:/usr/local/bin:$PATH

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
export PYTHONPATH=/usr/local/lib/python2.6/site-packages
#Point OSX to Cellar python 
export PYTHONPATH=/usr/local/lib/python:$PYTHONPATH
# CTAGS Sorting in VIM/Emacs is better behaved with this in place

export LC_COLLATE=C
export LC_ALL=en_US.UTF-8


# opam stuff
export OPAMJOBS=4

export WORKON_HOME=~/.virtualenvs

