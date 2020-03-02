# build 2020 Feb 13th.
# rsync from yogurt's /tmp/video/ to this server's $HOME/Videso/process/
rsync -havvztP --remove-source-files -e "ssh -p PortNumber " username@IpAddress:/tmp/video/ $HOME/Videos/process/

# move all original avi files to video dir keeping timestamps.
cp -p $HOME/Videos/process/*.avi $HOME/Videos/video/

# cd to working dir called process/
cd $HOME/Videos/process/

# Compress avi files as mp4.
sh $HOME/Workspace/ffmpeg_compressor.sh

# move mp4 files to vide_mini
mv $HOME/Videos/process/*.mp4 $HOME/Videos/video_mini/

# Clean up working dir
rm -rf $HOME/Videos/process/*.avi
rm -rf $HOME/Videos/process/*.h264
