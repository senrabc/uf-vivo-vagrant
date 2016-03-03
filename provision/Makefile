# This file is intended to help with testing conmeds.
# Some elements reused from redi/vagrant/Makefile.

help:
	@echo "\n " #newline
	@echo "\n Available tasks:"
	@echo "\t clean - get rid of any old output files and stuff"
	@echo "\n dump_triples - export all the triples to a file in N-triples"
	@echo "\n load_ufVivo_ontology - copy the local copy of the ufVivo ontology into the vagrant and load it"
	@echo "\n " #newline





clean:
	# get rid of any old csv output files
	-rm -rf out.txt


dump_triples:
	# using the custom mysql query in mysql-query-all-triples.sql this script will
	# export all triples out in an N-triples format. This format was extrapolated
	# from matching the output of the "rdf export" in the site admin of
	# the empty vagrant. ssh -c is needed to run remote commands on vagrant
	make clean && vagrant ssh -c 'cd provision/export_all_triples; mysql -uroot -pvivo vivo17dev < mysql-query-all-triples.sql > out.txt'

load_ufVivo_ontology:
	# move a copy of the ufVivo ontology into the vagrant using the filegraph method
	# https://wiki.duraspace.org/display/VIVO/Deploying+additional+ontologies+with+VIVO
	#
	-vagrant ssh -c 'sudo service tomcat7 stop'
	-vagrant ssh -c 'sudo cp provision/uf_vivo_ontology/* /usr/local/vdata/rdf/tbox/filegraph/'
	-vagrant ssh -c 'sudo service tomcat7 start'
