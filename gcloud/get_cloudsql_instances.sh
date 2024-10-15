#!/bin/bash

for x in $(gcloud projects list | tail -n +2 | awk '{ print $1}'); 
do 
  gcloud sql instances list --project $x
done

