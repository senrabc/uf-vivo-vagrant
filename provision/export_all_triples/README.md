# How to extract all triples in N-triples format from a vivo 1.7


You may need more memory in your vagrant to export out all triples.
To increase memory goto the Vagrantfile.

Change

  ```
  #Memory 2GBs
  config.vm.customize ["modifyvm", :id, "--memory", 2048]```
To
  ```
  #Memory 2GBs
  config.vm.customize ["modifyvm", :id, "--memory", 8192]```
Then

```$ vagrant up```

# Extras
If you are trying to use this vagrant to dump other triples using
a mysql backup then restore sql dump from other server if need be.

```$vagrant ssh #ssh into the vagrant to restore the db```

```$mkdir splits && cd splits```

Split the sql dump into smaller files to make the restore faster.
I've found this cuts the restore time in 1/2. Don't know exactly why,
but then I don't question stuff that works ;)


```$split -l 500 my_big_ol_sql_dumpfile.sql sql_```

You may want to do this with screen if it will take a while

```$screen -R restore```

To restore db

```$ cat splits/sql_* | mysql --host localhost -uroot -pvivo vivo17dev```

To exit screen us ctrl-A + ctrl-D
FYI, with backfiles +4GB The restore can take up to an hour or more.
