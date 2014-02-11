
all:

#ffmpeg=../ffmpeg/ffmpeg
ffmpeg=/usr/local/bin/ffmpeg
infile=test.mov

metadata:
	$(ffmpeg) -i $(infile) -f ffmetadata x.md

# libvpx, libvorbis
webm:
	$(ffmpeg) -y -i $(infile) -vcodec libvpx -acodec libvorbis x.webm

# h.264
# rotate

codecs:
	$(ffmpeg) -codecs 2>/dev/null | egrep '(vorb|264|vpx)'


test: metadata webm codecs
