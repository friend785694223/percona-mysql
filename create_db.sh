#!/bin/sh

if [ -z "$DBNAME" ] || [ -z "$DBUSER" ] || [ -z "$DBPASS" ]; then
  echo you should supply DBNAME/DBUSER/DBPASS envirements.
  exit 1
fi

echo "> Creating database $DBNAME, and grant privileges to $DBUSER"
mysql -e "create database $DBNAME; grant all on $DBNAME.* to '$DBUSER'@'localhost' identified by '$DBPASS';grant all on $DBNAME.* to '$DBUSER'@'%' identified by '$DBPASS';"
if [ $? -eq 0 ]; then
  echo "> Done, you can connect to your database $DBNAME: mysql -h host -P port -u$DBUSER -p$DBPASS $DBNAME"
else
  echo "> Fail."
  exit 1
fi
