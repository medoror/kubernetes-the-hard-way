#!/bin/bash

FILES_TO_COPY=$1
for worker in worker-0 worker-1 worker-2; do
  echo "Copying ${worker} stuff..."
  gcloud compute scp ${FILES_TO_COPY} ${worker}:~/
done
