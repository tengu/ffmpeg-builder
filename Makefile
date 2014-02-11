
sub_makes=$(wildcard */Makefile)
sub_dirs=$(patsubst %/Makefile,%,$(sub_makes))

all:
	for sub_dir in $(sub_dirs); do (cd $$sub_dir && make); done

%:
	for sub_dir in $(sub_dirs); do (cd $$sub_dir && make $@); done

