#! /bin/bash

n=0
on=0
fact=1

echo -n "Enter number to find factorial : "
read n

on=$n

while [ $n -ge  1 ]
do
  fact=`expr $fact \* $n`
  n=`expr $n - 1`
done

echo "Factorial for $on is $fact"