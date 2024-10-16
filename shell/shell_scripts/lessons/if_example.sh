#! /bin/bash
#
#Syntax:
#  if condition
#  then
#    if condition
#    then
#      .....
#      ..
#     do this
#    else
#      ....
#      ..
#      do this
#    fi
#  else
#    ...
#    .....
#    do this
#  fi
#
# You can also use
#   elif
#       ...
#   then
#
#


echo "Here an example of how to use if condition for numbers:"
echo
echo "Type a number from 1 to 10:"
read number
if test $number -gt 5
then
echo "This number is larger than 5"
fi
if test $number -lt 5
then
echo "This number is smaller than 5"
fi
echo
echo "Operators are: -eq, -ne, -lt, -gt, -ge"
echo
echo "****************************************************"
echo
echo "Here an example of how to use if condition for strings:"
echo
echo "Type a number your name:"
read name
if test $name != "john"
then
echo "Your name is not John, its $name"
else
echo "Your name is john! What the odds?"
fi
echo
echo "Operators are: =, !=, -n (not null, exist), -z null (exist)"
echo
echo "****************************************************"
echo
echo "Here an example of how to use if condition for files:"
echo
echo "Operators are: -s (non empty), -f (exist), -d (directory exist), -w (writeable), -r (read-only), -x (executable)"
echo
echo "****************************************************"
echo
echo "Here an example of how to use logical operators:"
echo
echo "Operators are: ! (NOT), -a (AND), -o (OR)"