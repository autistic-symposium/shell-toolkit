i#!/bin/bash

# saving things at /home
echo "Starting backup..."

cd YOUR_BACKUP_FOLDER
mkdir `date +%m-%d-%Y-$HOSTNAME`
cd `date +%m-%d-%Y-$HOSTNAME`


cp ~/.bashrc bashrc
cp /etc/issue.net .
cp ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings .

# AND OTHER CONF FILES YOU WANT TO SAVE

echo "Done!"


