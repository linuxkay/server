# build 2020 Feb 13th.
# rsync from yogurt's /tmp/video/ to this server's $HOME/Videso/process/
rsync -havvztP --remove-source-files -e "ssh -p putPortNumberHere " UserName@IPAddress:/tmp/video/ $HOME/Videos/process/

# move all original avi files to video dir keeping timestamps.
cp -p $HOME/Videos/process/*.avi $HOME/Videos/video/

# cd to working dir called process/
cd $HOME/Videos/process/

# Compress avi files mp4.
sh $HOME/Workspace/ffmpeg_compreser.sh

# Clean up working dir
rm -rf $HOME/Videos/process/*.avi
rm -rf $HOME/Videos/process/*.h264
