# /etc/skel/.bash_profile

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
#if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then startx; fi
if [[ -z $DISPLAY && $(tty) = /dev/tty1 ]]; then
    # XDG_CURRENT_DESKTOP="sway";
    # export XDG_CURRENT_DESKTOP;
    # dbus-run-session sway > /tmp/sway.log 2>&1;
    dbus-run-session Hyprland
fi

if [[ -f ~/.bashrc ]] ; then
	. ~/.bashrc
fi
