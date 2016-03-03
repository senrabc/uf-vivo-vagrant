# This file is intended to help with testing conmeds.
# Some elements reused from redi/vagrant/Makefile.

help:
	@echo "\n Available tasks:"
	@echo "\t clean	- get rid of any old output files and stuff"
	@echo "\n dump_triples	- export all the triples to a file in N-triples"






clean:
	# get rid of any old csv output files
	-rm -rf out.txt


dump_triples:
	# using the custom mysql query in mysql-query-all-triples.sql this script will
	# export all triples out in an N-triples format. This format was extrapolated
	# from matching the output of the "rdf export" in the site admin of
	# the empty vagrant. ssh -c is needed to run remote commands on vagrant
	make clean && vagrant ssh -c 'cd provision/export_all_triples; mysql -uroot -pvivo vivo17dev < mysql-query-all-triples.sql > out.txt'
