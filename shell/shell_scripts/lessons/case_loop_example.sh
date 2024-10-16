#!/bin/sh

# script to test case statement

if [ -z $1 ]
  then
  r="*** unknown ***"
elif [ -n $1 ]
  then
  r=$1
fi

case $r in
  "car") echo "car rental";;
  "van") echo "van rental";;
  "jeep") echo "jeep rental";;
  *) echo "Sorry I have no $r !";;
esac