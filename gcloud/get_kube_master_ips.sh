#!/bin/bash

projects=$(gcloud projects list | tail -n +2 | awk '{ print $1}');

for x in $projects; 
do 
  project_json=$(gcloud container clusters list --project $x --format json)
  echo $project_json | jq -e -r '.[] | .endpoint'
done
