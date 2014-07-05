#!/bin/sh

# script to test while statement

if [ $# -eq 0 ] # note the spaces
then
  echo "Error, missing argument!"
exit 1
fi
n=$1
i=1
while [ $i -le 10 ]
do
  echo "$n * $i = `expr $i \* $n`"
  i=`expr $i + 1`
done