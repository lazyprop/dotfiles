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
alias vi='nvim'

#alias dots="~/dotfiles"
#alias ttrv="ttrv --enable-media"

#eval "$(thefuck --alias)"

# replace coreutils with rust alternatives
##alias cat="bat"
alias ls="exa"
#alias find="fd"
#alias grep="rg"
alias rm="trash"

alias py="python"
alias ghc="ghc -no-keep-hi-files -no-keep-o-files"

alias xx="source ~/.xprofile"

# map ctrl+bksp to delete previous word
# stty werase undef
bind '"\b":backward-kill-word'

# advcpmv
#alias cp="advcp -g -r"
#alias mv="advmv -g"

alias sshsync="rsync -av --progress -e 'ssh -p 2222'"

# cleanup ~/
alias wget="wget --hsts-file='$XDG_CACHE_HOME/wget-hsts'"

#alias vi="nvim"
#. "$CARGO_HOME/env"

alias t="tmux"
alias ta="tmux attach"

mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

alias bye="shutdown now"

alias zt="sudo zerotier-cli"


set -o vi

#tmux attach
export PATH="${PATH}:${HOME}/.local/bin/"

[ -f "/home/iv/.ghcup/env" ] && . "/home/iv/.ghcup/env" # ghcup-env
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
. "$HOME/.cargo/env"
source /usr/share/nvm/init-nvm.sh


if [ -e /home/iv/.nix-profile/etc/profile.d/nix.sh ]; then . /home/iv/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
