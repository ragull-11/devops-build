#!/bin/bash

# Run the container on port 80
docker run -itd -p 80:80 my-react-app

# Login to Docker Hub
docker login -u ragul11 -p Ragul@docker2

# Tag and push based on branch
if [[ $GIT_BRANCH == "dev" ]]; then
    docker tag my-react-app ragul11/dev
    docker push ragul11/dev

elif [[ $GIT_BRANCH == "master" ]]; then
    docker tag my-react-app ragul11/prod
    docker push ragul11/prod
fi
