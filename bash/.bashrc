#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias l='ls -la'
PS1='[\u@\h \W]\$ '
alias term='$TERM &'
alias r='ranger'
alias qs='scheme --quiet < '
alias du='du -h'

#alias dots="~/dotfiles"
#alias ttrv="ttrv --enable-media"

#eval "$(thefuck --alias)"

# replace coreutils with rust alternatives
alias cat="bat"
alias ls="exa"
alias find="fd"
alias grep="rg"
alias rm="trash"

alias py="python"
alias ghc="ghc -no-keep-hi-files -no-keep-o-files"


# map ctrl+bksp to delete previous word
# stty werase undef
bind '"\b":backward-kill-word'

# advcpmv
alias cp="advcp -g -r"
alias mv="advmv -g"

alias sshsync="rsync -av --progress -e 'ssh -p 2222'"

# cleanup ~/
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"

export MANPAGER='nvim +Man!'

alias vi="nvim"
#. "$CARGO_HOME/env"

alias t="tmux"
alias ta="tmux attach"

mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

export PATH=~/.config/pdsite/bin:$PATH

alias bye="shutdown now"

alias zt="sudo zerotier-cli"
#[ -f "/home/iv/.ghcup/env" ] && source "/home/iv/.ghcup/env" # ghcup-env

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

[ -f "/home/iv/.ghcup/env" ] && source "/home/iv/.ghcup/env" # ghcup-env