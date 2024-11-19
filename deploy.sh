#!/bin/bash

docker run -itd -p 80:80 capstone
docker login -u ragul11 -p Ragul@docker2

if [[$GIT_BRANCH == "origin/dev"]]; then
    docker tag my-react-app ragul11/dev
    docker push ragul11/dev

elif [[$GIT_BRANCH == "origin/master"]]; then
    docker tag my-react-app ragul11/prod 
    docker push ragul11/pro
fi