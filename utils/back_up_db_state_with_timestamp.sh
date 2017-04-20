#!/bin/bash

#filenae: back_up_db_state_with_timestamp.sh
#purpose: allow a make command to run a backup from within the vagrant, but spit
#   the backup file out so we can see it in the external editor/filesytem of the
#   host/ Stamp dates, 'cause you will probably run it many times while testing
#author: senrabc@gmail.com
#auth_date: 2017-04-22


DB_HOST=localhost
DB_USER=root
DB_PASS=vivo
DB_NAME=vivo17dev

#use true or false, in bash returns 0 or 1
ZIP_DB=false
DB_TIMESTAMP=$(date +%Y_%m_%d_%H%M%S)

#backup the database

if [ $ZIP_DB = true ]; then
  mysqldump -h $DB_HOST -u$DB_USER -p$DB_PASS $DB_NAME | bzip2 -c > /vagrant/$DB_NAME$DB_TIMESTAMP.sql.bz2
else
  mysqldump -h $DB_HOST -u$DB_USER -p$DB_PASS $DB_NAME > /vagrant/$DB_NAME$DB_TIMESTAMP.sql
fi
