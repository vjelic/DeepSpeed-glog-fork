# print every command
# set -o xtrace

# set path
DOCKERFILE_PATH=docker/Dockerfile.rocm

# get tag
DOCKERFILE_NAME=$(basename $DOCKERFILE_PATH)
DOCKERIMAGE_NAME=$(echo "$DOCKERFILE_NAME" | cut -f 2- -d '.')

# build docker
docker build -f $DOCKERFILE_PATH -t deepspeed_rocm .
