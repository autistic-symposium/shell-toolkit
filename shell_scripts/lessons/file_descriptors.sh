#!/bin/sh

# from > & destination

if [ $# -ne 2 ]
  then
  echo "Error!" 1>&2
  echo "Usae: $0 number1 number2"
  exit 1
fi
ans=`expr $1 + $2`
echo "Sum = $ans"