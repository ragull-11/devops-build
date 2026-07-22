#!/bin/bash
set -e

IMAGE_NAME="devops-build"
TAG="${1:-local}"
PLATFORM="${BUILD_PLATFORM:-}"

if [ -n "$PLATFORM" ]; then
  echo "Building image: $IMAGE_NAME:$TAG for platform $PLATFORM"
  docker buildx build --platform "$PLATFORM" -t "$IMAGE_NAME:$TAG" --load .
else
  echo "Building image: $IMAGE_NAME:$TAG"
  docker build -t "$IMAGE_NAME:$TAG" .
fi

echo "Build complete."
docker images | grep "$IMAGE_NAME"
