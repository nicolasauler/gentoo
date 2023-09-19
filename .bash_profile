# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
if [[ -f ~/.bashrc ]] ; then
    # shellcheck source=/home/nic/.bashrc
	. ~/.bashrc
fi

. "$HOME/.cargo/env"

export PATH=$PATH:/home/nic/.cargo/bin
export PATH=$PATH:/home/nic/.local/bin

export EDITOR=nvim

export QT_QPA_PLATFORMTHEME=qt5ct
