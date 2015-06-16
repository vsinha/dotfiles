BASE=$HOME/dotfiles
ZSH_BASE=$BASE/zsh

source $ZSH_BASE/checks.zsh
source $ZSH_BASE/exports.zsh
source $ZSH_BASE/colors.zsh
source $ZSH_BASE/setopt.zsh
source $ZSH_BASE/plugins.zsh
source $ZSH_BASE/prompt.zsh
source $ZSH_BASE/completion.zsh
source $ZSH_BASE/aliases.zsh
source $ZSH_BASE/bindkeys.zsh
source $ZSH_BASE/functions.zsh
source $ZSH_BASE/history.zsh
source $ZSH_BASE/zsh_hooks.zsh
source $BASE/z/z.sh


if [[ -s $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm;
fi

if [[ -s /usr/local/bin/virtualenvwrapper.sh ]]; then
  export VIRTUALENVWRAPPER_SCRIPT=/usr/local/bin/virtualenvwrapper.sh
  source /usr/local/bin/virtualenvwrapper_lazy.sh
fi

# OPAM configuration
. /Users/viraj/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# pyenv setup
# http://apple.stackexchange.com/questions/160171/install-and-import-site-packages-for-python-2-and-3-on-mac
export PYENV_ROOT="$HOME/.pyenv"
pyenv() { # lazy load
  eval "$( command pyenv init - )"
  pyenv "$@"
}
