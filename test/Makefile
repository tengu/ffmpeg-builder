
all:

ffmpeg=/usr/local/bin/ffmpeg
infile=test.mov

codecs:
	$(ffmpeg) -codecs 2>/dev/null | egrep '(vorb|264|vpx)'

# xx no rotation info? use mencoder
metadata:
	$(ffmpeg) -y -i $(infile) -f ffmetadata /dev/stdout 2>/dev/null

# libvpx, libvorbis
webm:
	$(ffmpeg) -y -i $(infile) -vcodec libvpx -acodec libvorbis x.webm

h264:
	$(ffmpeg) -y -i $(infile) -vcodec libx264 -acodec aac x.h264
	file x.h264

rotate:
	$(ffmpeg) -i $(infile) -strict -2 -vf "rotate=90*(PI/180)" x.rotated.mp4
