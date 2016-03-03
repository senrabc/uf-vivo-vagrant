#!/bin/bash

# using the custom mysql query in mysql-query-all-triples.sql this script will
# export all triples out in an N-triples format. This format was extrapolated
# from matching the output of the "rdf export" in the site admin of
# the empty vagrant
mysql -uroot -pvivo vivo17dev < mysql-query-all-triples.sql > out.txt


# remove the first line of mysql output that has the column headers

tail -n +2 out.txt > out.temp


# if the triple doesn't have a datatype prop.
# you get crappy data out that snafus rdflib
# error is "rdflib.plugins.parsers.ntriples.ParseError: Invalid line: '^^<> . '
# you don't need them so I strip them and replace with white space

sed -- 's/"^^<>/"/g' out.temp > out1.temp

# cleanup from last step

#rm -Rf out.temp

# Clean up the data ************************************************************
# clear out any triples you don't want to publish
# images previously harvested have ufid in the name.jpg string
# ufid's are actually data
# patterns to remove to make sure the data has no restricted info in it

# http://vivo.ufl.edu/harvested/thumbDirDownload/ufid
# http://vivo.ufl.edu/ontology/vivo-ufl/ufid
# http://vivo.ufl.edu/harvested/peopleImage
# http://vivo.ufl.edu/harvested/thumbImg
# http://vivo.ufl.edu/harvested/mainImg
# http://vivo.ufl.edu/harvested/fullDirDownload

# cat out1.temp | \
# grep -vi http://vivo.ufl.edu/harvested/thumbDirDownload/ufid | \
# grep -vi http://vivo.ufl.edu/ontology/vivo-ufl/ufid | \
# grep -vi http://vivo.ufl.edu/harvested/peopleImage | \
# grep -vi http://vivo.ufl.edu/harvested/thumbImg | \
# grep -vi http://vivo.ufl.edu/harvested/mainImg | \
# grep -vi http://vivo.ufl.edu/harvested/fullDirDownload > out.temp

# cleanup from last step

# rm -Rf out1.temp

# more rdf lib errors. its doesnt lije quotes inside of the quoted text triple.
# I dropped the line.
# grep -v '"umbrella"' out5-sed.temp > out5-grep.temp
# grep -v '"unstable".' out5-grep.temp > out5-grep1.temp



# TODO: decide to keep or get rid of source file out.txt
