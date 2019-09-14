docker build -t $COMMIT_IMAGE_TAG_CLIENT - t $LATEST_IMAGE_TAG_CLIENT -f ./client/Dockerfile ./client
docker build -t $COMMIT_IMAGE_TAG_SERVER -t $LATEST_IMAGE_TAG_SERVER -f ./server/Dockerfile ./server
docker build -t $COMMIT_IMAGE_TAG_WORKER -t $LATEST_IMAGE_TAG_WORKER -f ./worker/Dockerfile ./worker
docker push $COMMIT_IMAGE_TAG_CLIENT
docker push $LATEST_IMAGE_TAG_CLIENT
docker push $COMMIT_IMAGE_TAG_SERVER
docker push $LATEST_IMAGE_TAG_SERVER
docker push $COMMIT_IMAGE_TAG_WORKER
docker push $LATEST_IMAGE_TAG_WORKER
kubectl apply -f k8s
kubectl set image deployments/client-deployment server=$COMMIT_IMAGE_TAG_CLIENT
kubectl set image deployments/server-deployment server=$COMMIT_IMAGE_TAG_SERVER
kubectl set image deployments/worker-deployment server=$COMMIT_IMAGE_TAG_WORKER