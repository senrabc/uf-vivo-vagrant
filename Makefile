# This file is intended to help with being reproducable.
# Some elements reused from redi/vagrant/Makefile.

#examples on augmenting inputs to your make commands :senrabc
#MAKE_CONFIG_FILE := Makefile.ini
#CONFIG_FOLDER        := $(shell cat ${MAKE_CONFIG_FILE} | sed -e 's/ //g' | grep -v '^\#' | grep 'config_folder=' | cut -d '=' -f2)
#CONFIG_FILE          := $(CONFIG_FOLDER)/settings.ini
#FAKE_DATA_FILE = fake_data.txt


help:
	@echo "\n Available tasks:"
	@echo "\t clean - clean up your mess!"
	@echo "\t build_vivo_vagrant - build vivo"




clean:
# eventually you'll need to clean
# -rm -rf some stufffff
	@echo "Nothing to see here. Move along!"
	@echo "No, really we haven't written any cleaning scripts yet"
build_vivo_vagrant:
#build a vivo vagrant 1.7
	vagrant up
