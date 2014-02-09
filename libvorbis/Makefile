
all:

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
build:
	cd $(src_dir); make
install: build
	cd $(src_dir); make install
	ldconfig

$(tarball): 
	wget $(release_url)

$(src_dir): $(tarball)
	tar xzf $<

$(src_dir)/config.h: $(src_dir)
	cd $(src_dir); ./configure --enable-shared --enable-static

