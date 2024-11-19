#!/bin/bash

docker login -u "$DOCKER_USERNAME" -p "$DOCKER_PASSWORD"

if [[ $GIT_BRANCH == "dev" ]]; then
    docker tag my-react-app ragul11/dev
    docker push ragul11/dev

elif [[ $GIT_BRANCH == "master" ]]; then
    docker tag my-react-app ragul11/prod
    docker push ragul11/prod
fi
