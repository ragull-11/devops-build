#!/bin/bash

# Exit script on error
set -e

# Login securely to Docker Hub
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Branch-based deployment logic
if [[ $GIT_BRANCH == "dev" ]]; then
    echo "Building and pushing Docker image for dev environment..."

    # Build the Docker image
    chmod +x build.sh
    ./build.sh

    # Tag and push the Docker image to the dev repository
    docker tag my-react-app "$DOCKER_USERNAME/dev:latest"
    docker push "$DOCKER_USERNAME/dev:latest"

elif [[ $GIT_BRANCH == "master" ]]; then
    echo "Building and pushing Docker image for prod environment..."

    # Build the Docker image
    chmod +x build.sh
    ./build.sh

    # Tag and push the Docker image to the prod repository
    docker tag my-react-app "$DOCKER_USERNAME/prod:latest"
    docker push "$DOCKER_USERNAME/prod:latest"

else
    echo "Branch not recognized. Exiting..."
    exit 1
fi

# Restart the containers using Docker Compose
docker-compose down || true
docker-compose up -d
