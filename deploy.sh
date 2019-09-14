#!/bin/bash

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=$COMMIT_IMAGE_TAG_SERVER
kubectl set image deployments/client-deployment client=$COMMIT_IMAGE_TAG_CLIENT
kubectl set image deployments/worker-deployment worker=$COMMIT_IMAGE_TAG_WORKER