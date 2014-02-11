all: build

include ../common.mk

home_url=https://www.xiph.org/downloads/
version=1.3.1
release_url=http://downloads.xiph.org/releases/ogg/libogg-$(version).tar.gz
release=libogg-$(version)
src_dir=$(release)
tarball=$(release).tar.gz

fetch: $(tarball)
extract: $(src_dir)
configure: $(src_dir)/config.h
build: $(src_dir)/config.h
	cd $(src_dir); make
install: # build
	find /usr/local | sort > x.0
	cd $(src_dir); make install
	find /usr/local | sort > x.1
	comm -23 x.1 x.0 > x.installed
	ldconfig

$(src_dir)/config.h: $(src_dir)
	cd $(src_dir); ./configure --enable-shared --enable-static

$(tarball): 
	wget $(release_url)

$(src_dir): $(tarball)
	tar xzf $<
