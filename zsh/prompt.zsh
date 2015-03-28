autoload -U colors && colors

# we want this to be fast, not overly fancy..
#PROMPT='%{$fg[blue]%}%~$(vcprompt -f " [%b%m]") %{$fg_bold[green]%}○%{${reset_color}%} '
PROMPT='%{$fg[blue]%}%~$(vcprompt -f " [%b%m]") %{$fg_bold[green]%}∴%{${reset_color}%} '
