How to extract all triples in N-triples format from a vivo 1.6.3

1. $ git clone git@github.com:lawlesst/vivo-vagrant.git
2. $ cd vivo-vagrant
3. git checkout v1.6
4. EDIT: Vagrantfile increase memory to 8GB, db needs more mem
  #Memory 2GBs
  config.vm.customize ["modifyvm", :id, "--memory", 2048]
  to
  #Memory 2GBs
  config.vm.customize ["modifyvm", :id, "--memory", 8192]
5. $ vagrant up
6. goto usr/local/share/vivo/backups/vivo-prod-db/daily on vivo.ufl.edu
7. get daily.gz (newest date) ex. daily_vivo_prod_db_2015-07-22_00h00m_Wednesday.sql.gz
8. vivo.ufl.edu$ cp daily_vivo_prod_db_2015-07-22_00h00m_Wednesday.sql.gz.gz ~/
9. localmachine$ scp cpb@vivo.ufl.edu:*.gz .
 10.  localmachine$ gzip -d daily_vivo_prod_db_2015-07-22_00h00m_Wednesday.sql.gz
11. cd into vivo-vagrant and put dailys.gz into /provision
12. $mv ../daily_vivo_prod_db_2015-07-22_00h00m_Wednesday.sql provision/
13. $vagrant ssh #ssh into the vagrant to restore the db
14. $mkdir splits && cd splits
15. $split the sql dump to make the restore faster.
    $split -l 500 ../daily_vivo_prod_db_2015-07-22_00h00m_Wednesday.sql sql_
16. $cd ..
17. screen -R restore
18. #restoredb $ cat splits/sql_* | mysql --host localhost -uroot -pvivo vivo16dev
19. #exitscreen $ ctrl-A ctrl-D
20. The restore can take up to an hour or more.
