all: build

clean:
	cd ffmpeg; make distclean
scrub:
	rm -fr ffmpeg

fetch: ffmpeg
configure: ffmpeg/config.h
build: ffmpeg/ffmpeg

ffmpeg:
	git clone git://source.ffmpeg.org/ffmpeg.git ffmpeg
#
# There are a few opens when a dependency fails:
# 1) remove from the list below
# 2) satisfy it with os' package, typically by <package-manager> install libfoo-dev
# 3) by building out of source. see ../lib*
# 
ffmpeg/config.h: ffmpeg
	cd ffmpeg; \
	./configure \
	    --enable-avfilter \
	    --enable-vdpau \
	    --enable-bzlib \
	    --enable-libopenjpeg \
	    --enable-libvorbis \
	    --enable-vaapi \
	    --enable-pthreads \
	    --enable-zlib \
	    --enable-libvpx \
	    --disable-stripping \
	    --enable-runtime-cpudetect \
	    --enable-libmp3lame \
	    --enable-nonfree \
	    --enable-gpl \
	    --enable-postproc \
	    --enable-x11grab \
	    --enable-libx264 \
	    --enable-version3 \
	    --enable-shared \
	    --disable-static \
	    --enable-pic

ffmpeg/ffmpeg: ffmpeg/config.h
	cd ffmpeg; make

check:
	ffmpeg/ffmpeg -codecs 2>/dev/null | egrep '(vorb|264|vpx)'

install:
	cd ffmpeg; make install
