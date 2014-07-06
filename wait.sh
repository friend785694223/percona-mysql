#!/bin/bash

[ -z "$1" ] && echo "Usage: $0 'command'" && exit 1
count=0
while [ $count -lt 50 ]; do
  mysql -e "show status" > /dev/null 2>&1 && break
  sleep 0.2
  (( count++ ))
done

[ $count -eq 50 ] && echo "wait mysqld more than 10s, timeout." && exit 1

eval "$1"
