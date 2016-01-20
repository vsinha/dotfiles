source $BASE/zsh/antigen/antigen.zsh

#antigen bundle git

antigen-bundle zsh-users/zsh-syntax-highlighting
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

if [ "$OSTYPE"="darwin11.0" ]; then
      antigen-bundle osx
fi

antigen-apply
