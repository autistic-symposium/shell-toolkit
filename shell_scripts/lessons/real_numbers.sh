#! /bin/bash


a=0
b=0
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

a=$1
b=$2

c=`echo $a + $b | bc`
echo "$a + $b = $c"