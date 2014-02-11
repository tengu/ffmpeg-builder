
all: build

include ../common.mk

home_url=https://www.xiph.org/downloads/
version=1.3.4
release_url=http://downloads.xiph.org/releases/vorbis/libvorbis-$(version).tar.gz
release=libvorbis-$(version)
src_dir=$(release)
tarball=$(release).tar.gz

# requires libogg-dev

fetch: $(tarball)
extract: $(src_dir)
configure: $(src_dir)/config.h
build_artifact=$(src_dir)/lib/.libs/libvorbisenc.so
build: $(build_artifact)
$(build_artifact): configure
	cd $(src_dir); make
install: # build
	find /usr/local | sort > x.0
	cd $(src_dir); make install
	find /usr/local | sort > x.1
	comm -23 x.1 x.0 > x.installed
	ldconfig

$(tarball): 
	wget $(release_url)

$(src_dir): $(tarball)
	tar xzf $<

$(src_dir)/config.h: $(src_dir)
	cd $(src_dir); ./configure --enable-shared --enable-static

