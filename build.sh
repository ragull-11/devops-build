#!/bin/bash

IMAGE_TAG="my-react-app:${GIT_BRANCH}"
docker build -t $IMAGE_TAG .
