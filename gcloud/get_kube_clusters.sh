#!/bin/bash

projects=$(gcloud projects list | tail -n +2 | awk '{ print $1}');

for x in $projects; 
do 
  echo $x
  gcloud container clusters list --project $x;
done
