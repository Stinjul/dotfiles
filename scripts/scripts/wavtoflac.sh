#!/bin/bash

for a in ./*.wav; do
  < /dev/null ffmpeg -i "$a" -qscale:a 0 "${a[@]/%wav/flac}"
done
