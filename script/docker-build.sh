#!/usr/bin/env bash
set -eo pipefail # Stop on first error and other error handling goodies

# Figure out the root of the repo
ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

# Set to the name of the Docker image you want to use
DOCKER_IMAGE_NAME=docs-site

# Build a custom Docker image that has custom Jekyll plug-ins installed
docker build --tag $DOCKER_IMAGE_NAME $ROOT

# Remove dangling images from previous runs
docker rmi -f $(docker images --filter "dangling=true" -q) > /dev/null 2>&1 || true

echo "******************************************************"
echo "  Your site will be available at http://localhost:4000/versions-jekyll/"
echo "******************************************************"

# Start Jekyll and watch for changes
docker run --rm -it \
    -e JEKYLL_ENV=production \
    --volume=/$(pwd):/srv/jekyll \
    --publish 4000:4000 \
    $DOCKER_IMAGE_NAME
