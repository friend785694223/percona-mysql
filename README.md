percona-mysql
=============

percona mysql for nicescale

Build
-----

  docker build -t nicescale/percona-mysql .


Run
-----


```bash
. path.ini
docker run -d -v $HOME/data:$data -v $HOME/log:$log nicescale/percona-mysql
```

Create Database
-----

  . path.ini

  docker run -v $HOME/data:$data -e DBNAME=dbtest -e DBUSER=dbtest\_user -e DBPASS=123qwe nicescale/percona-mysql /opt/nicedocker/create\_db.sh


If you need to automate your work, you can create database like this:

  docker run -v $HOME/data:$data -e DBNAME=dbtest -e DBUSER=dbtest\_user -e DBPASS=123qwe nicescale/percona-mysql /opt/nicedocker/wait.sh /opt/nicedocker/create\_db.sh

Script wait.sh will execute create\_db.sh until mysqld be ready.


Connect Database
-----

  . path

  docker run -it -v $HOME/data:$data nicescale/percona-mysql mysql  


Execute Sql
-----

  . path

  docker run -v $HOME/data:$data nicescale/percona-mysql mysql -e "select count(\*) from dbtest.testtable"


Backup Database
-----

  . path

  docker run -v $HOME/data:$data -v $HOME/backup:/backup nicescale/percona-mysql sh -c "mysqldump dbtest > /backup/dbtest"


Shutdown Database
-----

  . path

  docker run -v $HOME/data:$data nicescale/percona-mysql mysqladmin --no-defaults shutdown

