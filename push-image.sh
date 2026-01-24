##!/bin/bash

set -a
source .env
set +a

FULL_IMAGE_NAME="${DOCKERHUB_USERNAME}/${IMAGE_NAME}:${IMAGE_TAG}"

echo "Building Docker image: ${FULL_IMAGE_NAME}"

docker build -t "${FULL_IMAGE_NAME}" .

if [ $? -eq 0 ]; then
    echo "Docker image built successfully."
    echo "Attempting to log in to Docker Hub..."

    # docker login -u ${DOCKERHUB_USERNAME}
    echo "$DOCKERHUB_PASSWORD" | docker login -u "$DOCKERHUB_USERNAME" --password-stdin
    if [ $? -eq 0 ]; then
        echo "Login successful. Pushing image to Docker Hub..."

        docker push "${FULL_IMAGE_NAME}"

        if [ $? -eq 0 ]; then
            echo "Image pushed successfully to ${FULL_IMAGE_NAME}"
        else
            echo "Failed to push the image."
        fi
    else
        echo "Failed to log in to Docker Hub."
    fi
else
    echo "Failed to build the Docker image."
fi
