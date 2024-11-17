#!/bin/bash

if [[ $GIT_BRANCH == "dev" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u ragul11 -p 
    docker tag capstonenginx ragul11/dev
    docker push ragul11/dev

elif [[ $GIT_BRANCH == "main" ]]; then
    sh 'chmod +x build.sh'
    sh './build.sh'
    docker login -u ragul11 -p 
    docker tag project ragul11/prod 
    docker push ragul11/prod
fi