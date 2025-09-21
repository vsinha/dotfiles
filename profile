export LANGUAGE=en_US
export LC_CTYPE=en_US.UTF-8

export VISUAL=nvim
export EDITOR=nvim
export TERMINAL=kitty

# Less colorful output
export LESS=-R
export LESS_TERMCAP_me=$(printf '\e[0m')
export LESS_TERMCAP_se=$(printf '\e[0m')
export LESS_TERMCAP_ue=$(printf '\e[0m')
export LESS_TERMCAP_mb=$(printf '\e[1;32m')
export LESS_TERMCAP_md=$(printf '\e[1;34m')

export LESS_TERMCAP_us=$(printf '\e[1;32m')
export LESS_TERMCAP_so=$(printf '\e[1;44;1m')

export PATH=$HOME/bin:$PATH

## golang :'(
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$HOME/go/bin

## macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH=/usr/local/bin:$PATH
    export PATH=/usr/local/opt/coreutils/libexec/gnubin:$PATH
    export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
    export PATH=/usr/local/opt/grep/libexec/gnubin:$PATH
    export PATH=/usr/local/opt/gnu-sed/libexec/gnubin:$PATH
    export PATH=/usr/local/opt/util-linux/bin:$PATH
    export PATH=/usr/local/opt/util-linux/sbin:$PATH
    export PATH=/usr/local/opt/findutils/libexec/gnubin:$PATH
    # https://stackoverflow.com/a/70683186/4799273
    export PATH="$(brew --prefix)/opt/python@3/libexec/bin:$PATH"
fi

## Homebrew
if [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
elif [[ -d /home/linuxbrew ]]; then
    # https://docs.brew.sh/Homebrew-on-Linux
    export PATH=/home/linuxbrew/.linuxbrew/bin:$PATH
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# rustup
[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

# Make systemd aware of your modified $PATH.
# https://wiki.archlinux.org/title/Systemd/User#PATH
systemctl --user import-environment PATH


