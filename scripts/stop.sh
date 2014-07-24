#!/bin/bash

get_sid() {
  cdir=`dirname $0`
  cd $cdir/..
  tdir=`pwd`
  sid=`basename $tdir`
  echo $sid
}

sid=`get_sid`
if docker top $sid > /dev/null 2>&1; then
  /usr/local/bin/nicedocker exec $sid /opt/nicedocker/wait.sh 'mysqladmin --no-defaults shutdown'
else
  echo "service $sid not running."
fi
