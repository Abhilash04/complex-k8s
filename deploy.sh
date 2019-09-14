gcloud docker build -t $COMMIT_IMAGE_TAG_CLIENT - t $BRANCH_IMAGE_TAG_CLIENT -f ./client/gcloud Dockerfile ./client
gcloud docker build -t $COMMIT_IMAGE_TAG_SERVER -t $BRANCH_IMAGE_TAG_SERVER -f ./server/gcloud Dockerfile ./server
gcloud docker build -t $COMMIT_IMAGE_TAG_WORKER -t $BRANCH_IMAGE_TAG_WORKER -f ./worker/gcloud Dockerfile ./worker
gcloud docker push $COMMIT_IMAGE_TAG_CLIENT
gcloud docker push $BRANCH_IMAGE_TAG_CLIENT
gcloud docker push $COMMIT_IMAGE_TAG_SERVER
gcloud docker push $BRANCH_IMAGE_TAG_SERVER
gcloud docker push $COMMIT_IMAGE_TAG_WORKER
gcloud docker push $BRANCH_IMAGE_TAG_WORKER
kubectl apply -f k8s
kubectl set image deployments/client-deployment server=$COMMIT_IMAGE_TAG_CLIENT
kubectl set image deployments/server-deployment server=$COMMIT_IMAGE_TAG_SERVER
kubectl set image deployments/worker-deployment server=$COMMIT_IMAGE_TAG_WORKER