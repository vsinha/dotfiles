case "$SHELL" in
/usr/bin/bash)
  alias sb='source ~/.bashrc'
  ;;
/usr/bin/zsh)
  alias sb='source ~/.zshrc'
  ;;
esac

alias grep='grep --color=auto'

## cd alias
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

source ~/.sh/ls.sh
source ~/.sh/git.sh
source ~/.sh/systemd.sh
