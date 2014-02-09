all: extract build

include ../common.mk

libx264_work_dir=libx264
libx264_src_dir:=$(wildcard $(libx264_work_dir)/x264-*)

fetch: last_x264.tar.bz2
extract: x.extracted
configure: $(libx264_src_dir)/config.h

# http://www.videolan.org/developers/x264.html
last_x264.tar.bz2:
	wget ftp://ftp.videolan.org/pub/x264/snapshots/last_x264.tar.bz2

x.extracted: last_x264.tar.bz2
	mkdir -p $(libx264_work_dir)
	cd $(libx264_work_dir); bzcat $(PWD)/last_x264.tar.bz2 | tar xf -
	touch $@

$(libx264_src_dir)/config.h: x.extracted
	cd $(libx264_src_dir); ./configure --enable-shared --enable-static

build: $(libx264_src_dir)/config.h
	cd $(libx264_src_dir); make

install:
	cd $(libx264_src_dir); make install
	ldconfig

