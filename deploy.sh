#!/bin/bash
set -e

IMAGE_NAME="devops-build"
TAG="${1:-local}"
CONTAINER_NAME="devops-build-app"

echo "Deploying $IMAGE_NAME:$TAG as $CONTAINER_NAME"

docker rm -f "$CONTAINER_NAME" 2>/dev/null || true

docker run -d \
  -p 80:80 \
  --name "$CONTAINER_NAME" \
  --restart unless-stopped \
  "$IMAGE_NAME:$TAG"

echo "Deployed. Running containers:"
docker ps | grep "$CONTAINER_NAME"
