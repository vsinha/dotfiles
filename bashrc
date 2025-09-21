# # Source global definitions
# if [ -f /etc/bashrc ]; then
#   . /etc/bashrc
# fi

case "$TERM" in
xterm)
  export TERM=xterm-256color
  ;;
screen)
  export TERM=screen-256color
  ;;
esac

source ~/.sh/alias.sh

PS1='~ '
#PS1='\u@\h \[\e[0;34m\]\w$(~/dotfiles/vcprompt -f "[%b%m]") \[\e[0;32m\]$\[\e[m\] '
#PS1='\[\e[0;34m\]\w \[\e[0;32m\]\$\[\e[m\] '

# # bash history completion, bound to down and up arrows
# bind '"\e[A": history-search-backward'
# bind '"\e[B": history-search-forward'
# set show-all-if-ambiguous on
# set completion-ignore-case on
