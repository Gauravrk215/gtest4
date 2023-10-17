#!/bin/bash
PRJ_NAME=gtest4_test1_d-mysql
DOCKER_USER=farhan23432
DOCKER_PASS=Farhan@23432
DOCKER_URL=https://index.docker.io/v1/
CONT_PORT=3306
TARGET_PORT=3306
PATH_DIR=/data/13192_1697536709700/sureops_deploy/gtest4/sureops/gtest4_test1_d/deployment
**********************
cd $PATH_DIR
pwd
DOCKER_TAG=$(date +%s)
# Stop any existing containers with the same name and ports
docker stop $PRJ_NAME >/dev/null 2>&1 || true
docker rm $PRJ_NAME >/dev/null 2>&1 || true
# Build and push the Docker image
docker build -t $DOCKER_USER/$PRJ_NAME:$DOCKER_TAG --build-arg BUILD_ID=$DOCKER_TAG .
docker login --username=$DOCKER_USER --password=$DOCKER_PASS $DOCKER_URL
docker tag $DOCKER_USER/$PRJ_NAME:$DOCKER_TAG images.cloudnsure.com/$DOCKER_USER/$PRJ_NAME
docker push images.cloudnsure.com/$DOCKER_USER/$PRJ_NAME
IMAGE_ID=$(docker images --format "{{.ID}}" $IMAGE_NAME)
docker logout $DOCKER_URL
docker system prune -f
# Deploy the image in a Docker container
#docker run -d --name $PRJ_NAME -p $CONT_PORT:$TARGET_PORT $DOCKER_USER/$PRJ_NAME:$DOCKER_TAG
#echo "Image $IMAGE_ID deployed in container $PRJ_NAME"