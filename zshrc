BASE=$HOME/dotfiles
ZSH_BASE=$BASE/zsh

source $BASE/zsh/antigen/antigen.zsh

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

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

precmd() {
  if [[ -n "$TMUX" ]]; then
    tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
  fi
}

if [[ -s $HOME/.rvm/scripts/rvm ]]; then
  source $HOME/.rvm/scripts/rvm;
fi


if [[ -s /usr/local/bin/virtualenvwrapper.sh ]]; then
  source /usr/local/bin/virtualenvwrapper.sh
fi

# OPAM configuration
. /Users/viraj/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
