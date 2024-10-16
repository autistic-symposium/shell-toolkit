#!/bin/sh
#
#         dialog --title {title} --backtitle {backtitle} {Box options}
#        where Box options can be any one of following
#       --yesno      {text}  {height} {width}
#       --msgbox     {text}  {height} {width}
#       --infobox    {text}  {height} {width}
#       --inputbox   {text}  {height} {width} [{init}]
#       --textbox    {file}  {height} {width}
#      --menu       {text}  {height} {width} {menu} {height} {tag1} item1}...
#
#

dialog \
--title "Hello $LOGNAME" \
--backtitle "Linux Shell Script - Bytegirl Tutorial" \
--msgbox "This is dialog box called infobox, which is used \
to show some information on screen, Thanks to Savio Lam and\
Stuart Herbert to give us this utility. Press any key. . . " \
9 50 ; read



dialog --title "Alert : Delete File" --backtitle "Linux Shell Script\
Tutorial" --yesno "\nDo you want to delete '/usr/letters/jobapplication'\
file" 7 60
sel=$?
case $sel in
   0) echo "User select to delete file";;
   1) echo "User select not to delete file";;
   255) echo "Canceled by user by pressing [ESC] key";;
esac



$ cat > dia4
dialog --title "Inputbox - To take input from you" --backtitle "Linux Shell\
Script Tutorial" --inputbox "Enter your name please" 8 60 2>/tmp/input.$$

sel=$?

na=`cat /tmp/input.$$`
case $sel in
  0) echo "Hello $na" ;;
  1) echo "Cancel is Press" ;;
  255) echo "[ESCAPE] key pressed" ;;
esac

rm -f /tmp/input.$$