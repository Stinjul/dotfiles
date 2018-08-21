xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

export QT_QPA_PLATFORMTHEME="qt5ct"

xrdb -merge ~/.Xresources
numlockx &
exec i3
