#!/bin/bash

#filenae: dump_random_25_triples_to_plain_text.sh
#purpose: dump out 25 triples to a text FILE
#author: senrabc@gmail.com
#auth_date: 2017-04-22


#use true or false, in bash returns 0 or 1
ZIP_DB=false
FILE_TIMESTAMP=$(date +%Y_%m_%d_%H%M%S)

curl  -i \
      -d 'email=vivo_root@school.edu' -d 'password=password' \
      -d 'query=SELECT ?s ?p ?o WHERE {?s ?p ?o} LIMIT 25' \
      -H 'Accept: text/plain' \
        'http://localhost:8080/vivo/api/sparqlQuery' \
      -o /vagrant/25_triples_random_$FILE_TIMESTAMP.txt
