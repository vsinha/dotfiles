# Lots of inspiration from https://github.com/SilverRainZ/dotfiles

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.bashrc

export HISTFILE=$HOME/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=1000000000
setopt incappendhistory
setopt extended_history
setopt hist_find_no_dups
setopt share_history


typeset -aU path
path+=('/home/viraj/bin')
path+=('/usr/local/go/bin')
export PATH


alias sudo='sudo env "PATH=$PATH"'
alias sb="source ~/.zshrc"

alias vim='nvim'
export EDITOR=nvim

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# OSX
bindkey '^[[1;3D' backward-word
bindkey '^[[1;3C' forward-word
# Windows
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#
source <(fzf --zsh)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
