#!/bin/bash

FILES_TO_COPY=$1
for controller in controller-0 controller-1 controller-2; do
  echo "Copying ${controller} stuff..."
  gcloud compute scp ${FILES_TO_COPY} ${controller}:~/
done
