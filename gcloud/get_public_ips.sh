#!/bin/bash

for x in $(gcloud projects list | tail -n +2 | awk '{ print $1}'); 
do 
  ip_list=$(gcloud compute instances list --project $x --format json)
  gcloud compute instances list --project $x --format json | jq -r '.[] | .networkInterfaces[] | .accessConfigs[] | .natIP';
done

