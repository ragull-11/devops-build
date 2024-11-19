#!/bin/bash

# Get the branch name, whether we're in detached HEAD state or not
export GIT_BRANCH=$(git symbolic-ref --short HEAD || git rev-parse --short HEAD)

echo "Current branch inside script: $GIT_BRANCH"

# Check the branch and take action accordingly
if [[ $GIT_BRANCH == "dev" ]]; then
    chmod +x build.sh
    build.sh
    docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
    docker tag my-react-app ragul11/dev
    docker push ragul11/dev

elif [[ $GIT_BRANCH == "master" ]]; then
    chmod +x build.sh
    build.sh
    docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
    docker tag my-react-app ragul11/prod
    docker push ragul11/prod

else
    echo "Branch $GIT_BRANCH is not recognized. Exiting."
    exit 1
fi
