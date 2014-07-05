#! /bin/bash
# script to print a chessboard

for (( i = 1; i <= 9; i++ ))
do
  for (( j = 1; j <= 9; j++))
  do
    tot=`expr $i + $j` # notice that these tot must have no space to =
    tmp=`expr $tot % 2`
    if [ $tmp -eq 0 ]; then
      echo -e -n "\033[47m  "
    else
      echo -e -n "\033[40m  "
    fi
  done
  echo -e -n "\033[40m" # set to black
  echo"" # print new line
done