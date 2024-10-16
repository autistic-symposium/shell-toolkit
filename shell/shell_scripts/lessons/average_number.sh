#!/bin/bash
#

avg=0
temp_total=0
number_of_args=$#

#
# First see the sufficient cmd args
#
if [ $# -lt 2 ] ; then
   echo -e "Opps! I need atleast 2 command line args\n"
   echo -e "Syntax: $0: number1 number2 ... numberN\n"
   echo -e "Example:$0 5 4\n\t$0 56 66 34"
   exit 1
fi

#
# now calculate the average of numbers given on command line as cmd args
#

for i in $*
do

   #  addition of all the numbers on cmd args
   temp_total=`expr $temp_total + $i`

done

avg=`expr $temp_total / $number_of_args`
echo "Average of all number is $avg"