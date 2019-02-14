xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

xrdb -merge ~/.Xresources
numlockx &
exec i3
