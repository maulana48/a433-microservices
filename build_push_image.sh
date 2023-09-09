#!/bin/bash

# docker image
IMAGE_NAME="item-app"
# docker image
IMAGE_TAG="v1"
# docker image yang akan diunggah ke GitHub Packages
GITHUB_PACKAGE_IMAGE="ghcr.io/maulana48/$IMAGE_NAME:$IMAGE_TAG"

# membuat Docker image
docker build -t $IMAGE_NAME:$IMAGE_TAG .

# melihat daftar image di lokal
docker images

# mengubah nama image agar sesuai dengan format GitHub Packages
docker tag $IMAGE_NAME:$IMAGE_TAG $GITHUB_PACKAGE_IMAGE

# login ke GitHub Packages (maaf tidak pakai .env)
cat password.txt | docker login ghcr.io --username maulana48 --password-stdin

# mengunggah image ke GitHub Packages
docker push $GITHUB_PACKAGE_IMAGE

# membuild container dari Docker compose
docker-compose up -d --build

# start Docker compose
docker-compose start
