#!/bin/bash

projects=$(gcloud projects list | tail -n +2 | awk '{ print $1}')

list_app () {
  gcloud app services list --project $1 2>&1 | grep -v ERROR
}

for x in $projects; 
do 
  list_app $x
done

