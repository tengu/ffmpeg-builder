
all:

ffmpeg=../ffmpeg/ffmpeg
infile=test.mov

metadata:
	$(ffmpeg) -i $(infile) -f ffmetadata x.md

# libvpx, libvorbis
webm:
	$(ffmpeg) -y -i $(infile) -vcodec libvpx -acodec libvorbis x.webm

codecs:
	$(ffmpeg) -codecs 2>/dev/null | egrep '(vorb|264|vpx)'
