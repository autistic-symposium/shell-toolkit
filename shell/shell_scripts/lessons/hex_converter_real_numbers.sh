#! /bin/bash

n=0
hex=0
echo "Decimal to hexadecimal converter:"
echo -n "Enter number in decimal format : "
read n
hex=`echo "obase=16;ibase=10; $n" | bc`
echo "$n is equivalent \"$hex\" in hexadecimal"

