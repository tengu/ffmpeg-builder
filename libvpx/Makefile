
all: build
include ../common.mk

# http://www.webmproject.org/code/
# http://code.google.com/p/webm/downloads/list
version=v1.3.0
release=libvpx-$(version)
src_dir=$(release)
tarball=$(release).tar.bz2

fetch: $(tarball)
extract: $(release)
configure: $(src_dir)/Makefile
build: $(src_dir)/libvpx.so
install: # /usr/local/lib/libvpx.so

$(tarball):
	wget http://webm.googlecode.com/files/$(tarball)

$(src_dir): $(tarball)
	bzcat $< | tar xf -

# xx requires yasm
$(src_dir)/Makefile: extract
	cd $(src_dir); ./configure --enable-shared --enable-static

$(src_dir)/libvpx.so: configure
	cd $(src_dir); make

/usr/local/lib/libvpx.so: $(src_dir)/libvpx.so
	find /usr/local | sort > $(src_dir)/x.0
	cd $(src_dir); make install
	find /usr/local | sort > $(src_dir)/x.1
	cd $(src_dir); comm -23 x.1 x.0 > x.installed
