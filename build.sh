#!/bin/bash
set -e

IMAGE_NAME="devops-build"
TAG="${1:-local}"

echo "Building image: $IMAGE_NAME:$TAG"
docker build -t "$IMAGE_NAME:$TAG" .

echo "Build complete."
docker images | grep "$IMAGE_NAME"
