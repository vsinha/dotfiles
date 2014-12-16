source ~/dotfiles/zsh/checks.zsh
source ~/dotfiles/zsh/exports.zsh
source ~/dotfiles/zsh/colors.zsh
source ~/dotfiles/zsh/setopt.zsh
source ~/dotfiles/zsh/prompt.zsh
source ~/dotfiles/zsh/completion.zsh
source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/bindkeys.zsh
source ~/dotfiles/zsh/functions.zsh
source ~/dotfiles/zsh/history.zsh
source ~/dotfiles/zsh/zsh_hooks.zsh
#source ~/.zsh/hitch.zsh
#source /opt/boxen/env.sh
source ~/dotfiles/z/z.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

precmd() {
  if [[ -n "$TMUX" ]]; then
    tmux setenv "$(tmux display -p 'TMUX_PWD_#D')" "$PWD"
  fi
}
