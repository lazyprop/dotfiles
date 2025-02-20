
export PATH=/usr/local/cuda-12.5/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-12.5/lib64\
                         ${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
export LC_ALL=en_US.UTF-8

# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

startx
. "$HOME/.cargo/env"

if [ -e /home/iv/.nix-profile/etc/profile.d/nix.sh ]; then . /home/iv/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
