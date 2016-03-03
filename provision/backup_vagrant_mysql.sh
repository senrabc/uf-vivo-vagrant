#!/bin/bash
#
#
#Database
VIVO_DATABASE=vivo17dev

mysqldump -u root -pvivo $VIVO_DATABASE > dumpfilename.sql
