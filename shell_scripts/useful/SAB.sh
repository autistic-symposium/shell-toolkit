#! /bin/bash
#

echo "Stunnel on?"
ps aux | grep stunnel
echo
echo "Starting secure SABnzbd... "
echo
python /opt/SABnzbd-0.7.17/SABnzbd.py && google-chrome localhost:8080/sabnzbd
echo
echo "Remember to kill the process after closing the browser!!!"
echo
