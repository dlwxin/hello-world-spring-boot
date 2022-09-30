#!/bin/bash

SCRIPT_NAME=$0
SCRIPT_PATH=$( cd $(dirname $0) && pwd)
CURR_DIR=`pwd`
GIT_REPO_PATH="$( cd $SCRIPT_PATH && cd .. && pwd )"
DOCKER_FILE=Dockerfile
CMD_DATE="date '+%Y-%m-%d %H:%M:%S'"

VERSION=$1
if [[ $VERSION == '' ]]; then
  VERSION=latest
fi
APP_NAME=hello-world-spring-boot
IMAGE_TAG=$APP_NAME:$VERSION
PORT_MAPPING=8080:8080

function doUsage() {
  echo "Usage: $SCRIPT_NAME [version]"
  echo "The default value of version: latest"
  echo "Example:"
  echo "  $SCRIPT_NAME 1.3.2 "
  echo " OR "
  echo " $SCRIPT_NAME "
  exit 1
}

function doPreBuild(){

  CONTAINER_IDS=$(docker ps -a | grep -i $APP_NAME | awk '{print $1}')
  if [[ $CONTAINER_IDS != "" ]]; then
    echo "Removing older containers: $CONTAINER_IDS"
    docker rm -f $CONTAINER_IDS
  fi

  PREVIOUS_IMAGE_ID=$(docker images | grep -i $APP_NAME | grep -i $VERSION | awk '{print $3}')
  if [[ $PREVIOUS_IMAGE_ID != "" ]]; then
    echo "Current date: `date`"
    echo "The detail information of previous image $APP_NAME"
    docker images | grep -i $APP_NAME
    echo
    echo "Removing previous image: $PREVIOUS_IMAGE_ID"
    docker rmi $PREVIOUS_IMAGE_ID
  fi
}

function doBuildImage(){
  echo "============================================"
  echo "Start building image..."
  cd $GIT_REPO_PATH
  echo "docker build -t $IMAGE_TAG -f $DOCKER_FILE ."
  docker build -t $IMAGE_TAG -f $DOCKER_FILE .
}

function doRunApp(){
  echo "============================================"
  echo "Start running the container..."
  docker container run -d \
     --name $APP_NAME \
     -p $PORT_MAPPING $IMAGE_TAG

  sleep 3
  docker ps | grep $IMAGE_TAG
}

#################   Main Function ########################

echo "The path to execute the $SCRIPT_NAME (where the script is executed): $CURR_DIR"
echo ""
echo "The path where the script $SCRIPT_NAME is located: $SCRIPT_PATH"
cd $SCRIPT_PATH
START_TIME=$(eval $CMD_DATE)

doPreBuild
doBuildImage
doRunApp

cd $CURR_DIR
END_TIME=$(eval $CMD_DATE)
echo
echo "#########################################"
echo "Start: ${START_TIME} - Finish: ${END_TIME}"
echo "DEPLOYMENT TASK = COMPLETED"
