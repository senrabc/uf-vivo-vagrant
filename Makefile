# This file is intended to help with testing conmeds.
# Some elements reused from redi/vagrant/Makefile.

help:
	@echo "\n " #newline
	@echo "\n Available tasks:"
	@echo "\t clean - get rid of any old output files and stuff"
	@echo "\t back_up_current_db_state - dump out a timestamped data base dump file of the mysql data base."
	@echo "\t build_vivo_vagrant - build vivo"
	@echo "\n " #newline



clean:
# eventually you'll need to clean
# -rm -rf some stufffff
	@echo "Nothing to see here. Move along!"
	@echo "No, really we haven't written any cleaning scripts yet"

back_up_current_db_state:
	# dump out a timestamped data base dump file of the mysql data base.
	-vagrant ssh -c 'bash /vagrant/utils/back_up_db_state_with_timestamp.sh'

build_vivo_vagrant:
#build a vivo vagrant 1.7
	vagrant up
