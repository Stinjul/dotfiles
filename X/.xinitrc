xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto
xrandr --listproviders

xrdb -merge ~/.Xresources
numlockx &
exec i3
