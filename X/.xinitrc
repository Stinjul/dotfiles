if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

xrdb -merge ~/.Xresources
sxhkd &
numlockx &
#exec dbus-launch --exit-with-session i3
exec i3
