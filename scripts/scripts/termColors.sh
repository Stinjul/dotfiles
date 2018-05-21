#!/bin/bash

while read -r var val; do
    printf -v $var "$val"
done < <(xrdb -query | egrep '\*\.' | sed '/font/d; s/[*.:]//g')

#(set -o posix ; set)
printf "\e]4;0;$color0\e\\"
printf "\e]4;1;$color1\e\\"
printf "\e]4;2;$color2\e\\"
printf "\e]4;3;$color3\e\\"
printf "\e]4;4;$color4\e\\"
printf "\e]4;5;$color5\e\\"
printf "\e]4;6;$color6\e\\"
printf "\e]4;7;$color7\e\\"
printf "\e]4;8;$color8\e\\"
printf "\e]4;9;$color9\e\\"
printf "\e]4;10;$color10\e\\"
printf "\e]4;11;$color11\e\\"
printf "\e]4;12;$color12\e\\"
printf "\e]4;13;$color13\e\\"
printf "\e]4;14;$color14\e\\"
printf "\e]4;15;$color15\e\\"
printf "\e]10;$foreground\e\\" #foreground
printf "\e]11;$background\e\\" #background
printf "\e]12;$cursorColor\e\\" #cursor
printf "\e]17;$background\e\\" #highlight_foreground
printf "\e]19;$cursorColor\e\\" #highlight_background

