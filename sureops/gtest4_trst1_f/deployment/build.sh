#!/bin/bash
PRJ_NAME=gtest4_trst1_f-flutter-web
DOCKER_USER=farhan23432
DOCKER_PASS=Farhan@23432
DOCKER_URL=https://index.docker.io/v1/
#********************
REPO_NAME=gtest4
GITEA_USER=Gauravrk215
GITEA_PASS=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
GITEA_EMAIL=gauravrk215@gmail.com
GIT_BRANCH=main
DOMAIN=github.com
#TARGET_PORT=9292
PATH_DIR=/data/13192_1697536709700/sureops_deploy/gtest4/sureops/gtest4_trst1_f/deployment
**********************
cd $PATH_DIR
DOCKER_TAG=$(date +%s)
docker system prune -f
IMAGE_NAME=$DOCKER_USER/$PRJ_NAME:$DOCKER_TAG
# Stop any existing containers with the same name and ports
docker stop $PRJ_NAME >/dev/null 2>&1 || true
docker rm $PRJ_NAME >/dev/null 2>&1 || true
# Build and push the Docker image
DOCKER_BUILDKIT=0 docker build -t $DOCKER_USER/$PRJ_NAME:$DOCKER_TAG --build-arg BUILD_ID=$DOCKER_TAG .
docker login --username=$DOCKER_USER --password=$DOCKER_PASS $DOCKER_URL
#docker push $DOCKER_USER/$PRJ_NAME:$DOCKER_TAG
docker tag $IMAGE_NAME $DOCKER_URL/$DOCKER_USER/$PRJ_NAME
docker push $DOCKER_URL/$DOCKER_USER/$PRJ_NAME
docker logout $DOCKER_URL
docker system prune -f
# Deploy the image in a Docker container
echo "Image deployed in container $PRJ_NAME"