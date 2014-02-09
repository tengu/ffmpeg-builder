
lib_dirs=$(wildcard lib*)
sub_dirs=$(lib_dirs) ffmpeg

all:
	for sub_dir in $(sub_dirs); do (cd $$sub_dir; make); done

%:
	for sub_dir in $(sub_dirs); do (cd $$sub_dir; make $@); done

