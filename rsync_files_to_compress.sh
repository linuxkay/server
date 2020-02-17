#!/usr/bin/bash
#built 2020 Feb 13th

# rsync from yogurt's /tmp/video/ to this server's $HOME/Videso/process/
rsync -havztP --remove-source-files -e "ssh -p putPortNumberHere " username@ipaddress:/tmp/video/ $HOME/Videos/process/

# move all original avi files to video dir keeping timestamps.
cp -p $HOME/Videos/process/*.avi $HOME/Videos/video/

# Compress avi files save all as mp4 files.
cd $HOME/Videos/process/

for i in *.avi; do ffmpeg -i "$i" -c:v libx264 -preset medium -crf 32  -an "$HOME//Videos/video_mini/${i%.*}.mp4"; done

# Delete all avi files in /process dir since its finished
rm -rf $HOME//Videos/process/*.avi
rm -rf $HOME/Videos/process/*.h264
