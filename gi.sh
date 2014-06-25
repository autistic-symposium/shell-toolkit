#!/bin/bash
input_variable  = 'test'
read -p "Commit message?" input_variable
git add -A
git commit -m  "$input_variable"
git push origin master