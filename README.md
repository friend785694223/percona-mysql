percona-mysql
=============

percona mysql for nicescale

Build
-----

```bash
docker build -t nicescale/percona-mysql .
```

Run
-----
```bash
. path.ini
docker run -d -v $HOME/data:$data -v $HOME/log:$log nicescale/percona-mysql
```

Create Database
-----
```bash
. path.ini
docker run -v $HOME/data:$data -e DBNAME=dbtest -e DBUSER=dbtest_user -e DBPASS=123qwe nicescale/percona-mysql /opt/nicedocker/create_db.sh
```
If you need to automate your work, you can create database like this:
```bash
docker run -v $HOME/data:$data -e DBNAME=dbtest -e DBUSER=dbtest_user -e DBPASS=123qwe nicescale/percona-mysql /opt/nicedocker/wait.sh /opt/nicedocker/create_db.sh
```
Script wait.sh will execute create\_db.sh until mysqld be ready.

Connect Database
-----
```bash
. path
docker run -it -v $HOME/data:$data nicescale/percona-mysql mysql  
```

Execute Sql
-----
```bash
. path
docker run -v $HOME/data:$data nicescale/percona-mysql mysql -e "select count(\*) from dbtest.testtable"
```

Backup Database
-----
```bash
. path
docker run -v $HOME/data:$data -v $HOME/backup:/backup nicescale/percona-mysql sh -c "mysqldump dbtest > /backup/dbtest"
```

Shutdown Database
-----
```bash
. path
docker run -v $HOME/data:$data nicescale/percona-mysql mysqladmin --no-defaults shutdown
```
