#!/bin/bash

if [[ $GIT_BRANCH == "dev" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u ragul11 -p Ragul@docker2
    docker tag my-react-app ragul11/dev
    docker push ragul11/dev

elif [[ $GIT_BRANCH == "master" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u ragul11 -p Ragul@docker2
    docker tag my-react-app ragul11/prod 
    docker push ragul11/prod
fi