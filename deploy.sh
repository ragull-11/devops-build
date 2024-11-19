#!/bin/bash

if [[ $GIT_BRANCH == "origin/dev" ]]; then
    chmod +x build/build.sh
    build/build.sh
    docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
    docker tag my-react-app ragul11/dev
    docker push ragul11/dev

elif [[ $GIT_BRANCH == "origin/master" ]]; then
    chmod +x build/build.sh
    build/build.sh
    docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
    docker tag my-react-app ragul11/prod
    docker push ragul11/prod

else
    echo "Branch $GIT_BRANCH is not recognized. Exiting."
    exit 1
fi