#!/bin/bash

#filenae: dump_all_triples_to_csv.sh
#purpose: dump out all the triples to a csv FILE
#author: senrabc@gmail.com
#auth_date: 2017-04-22


#use true or false, in bash returns 0 or 1
ZIP_DB=false
FILE_TIMESTAMP=$(date +%Y_%m_%d_%H%M%S)

curl  -i \
      -d 'email=vivo_root@school.edu' -d 'password=password' \
      -d 'query=SELECT ?s ?p ?o WHERE {?s ?p ?o} LIMIT 5' \
      -H 'Accept: text/csv' \
        'http://localhost:8080/vivo/api/sparqlQuery' \
      -o /vagrant/all_triples_csv_$FILE_TIMESTAMP.csv
