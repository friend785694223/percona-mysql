percona-mysql
=============

percona mysql for nicescale

Build
-----

  docker build -t nicescale/percona-mysql .


Run
-----

  . path.ini
  docker run -d -v $HOME/data:$data -v $HOME/log:$log nicescale/percona-mysql


Create Database
-----

  . path
  docker run -v $HOME/data:$data -e DBNAME=dbtest -e DBUSER=dbtest\_user -e DBPASS=123qwe nicescale/percona-mysql /opt/nicedocker/create\_db.sh


Connect Database
-----

  . path
  docker run -v $HOME/data:$data nicescale/percona-mysql mysql  


Backup Database
-----

  . path
  docker run -v $HOME/data:$data -v $HOME/backup:/backup nicescale/percona-mysql sh -c "mysqldump dbtest > /backup/dbtest"


Shutdown Database
-----

  . path
  docker run -v $HOME/data:$data nicescale/percona-mysql mysqladmin --no-defaults shutdown

