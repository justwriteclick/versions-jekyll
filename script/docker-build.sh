#!/usr/bin/env bash

# Stop on first error
set -e

# Run from the root directory of the project
cd ../

# Set to the name of the Docker image you want to use
DOCKER_IMAGE_NAME=docs-site

if [ -e Dockerfile ]; then
    # Build a custom Docker image that has custom Jekyll plug-ins installed
    docker build --no-cache --tag $DOCKER_IMAGE_NAME --file Dockerfile .

    # Remove dangling images from previous runs
    docker rmi -f $(docker images --filter "dangling=true" -q) > /dev/null 2>&1 || true
else
    # Use an existing Jekyll Docker image
    DOCKER_IMAGE_NAME=grahamc/jekyll
fi

echo "******************************************************"
echo "  Your site will be available at http://localhost:4000"
echo "******************************************************"

# Start Jekyll and watch for changes
docker run --rm \
    -e JEKYLL_ENV=production \
    --volume=/$(pwd):/src \
    --publish 4000:4000 \
    $DOCKER_IMAGE_NAME \
    serve --watch --drafts --force_polling -H 0.0.0.0 \
    --config _config.yml,_config.container.yml

