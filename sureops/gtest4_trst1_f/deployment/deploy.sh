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
#WEB-URL-PORT
CONT_PORT=32121
TARGET_PORT=80
#**********************
docker login --username="$DOCKER_USER" --password="$DOCKER_PASS" "$DOCKER_URL"
docker pull images.cloudnsure.com/risadmin/$PRJ_NAME
if docker network inspect gtest4 &> /dev/null; then
  echo "The Docker network 'gtest4' already exists."
else
 docker network create gtest4
  echo "Created Docker network 'gtest4."
fi
docker run -d --restart always --network gtest4 --name $PRJ_NAME -p $CONT_PORT:$TARGET_PORT images.cloudnsure.com/risadmin/$PRJ_NAME
docker logout