[[ -f ~/.bashrc ]] && . ~/.bashrc

LANG=en_US.UTF-8

# defaults
export BROWSER="firefox"
export READER="zathura"
export VISUAL="nvim"
export EDITOR="$VISUAL"
#export TERM="termite"


# xdg defaults
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"


# ~/ cleanup
export CARGO_HOME="$XDG_CONFIG_HOME/cargo"
export GOPATH="$XDG_DATA_HOME/go"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export INPUTRC="$XDG_CONFIG_HOME/readline/inputrc"
export DOT_SAGE="$XDG_CONFIG_HOME/sage"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

# PATH
export PATH=~/.local/bin:$PATH
export PATH=~/.dotnet:$PATH

startx $XINITRC
. "$CARGO_HOME/env"
