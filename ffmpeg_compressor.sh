#!/bin/sh

for i in $HOME/Videos/process/*.avi; do ffmpeg -y -i "$i" -c:v libx264 -preset medium -crf 32  -an "${i%.*}.mp4"; done
