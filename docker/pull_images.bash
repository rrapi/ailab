#!/bin/bash

IMAGE_VERSION=latest

if [ "$1" != "" ]; then
  IMAGE_VERSION=$1
fi


docker pull devrt/xserver
docker pull francirrapi/ros_noetic_gazebo:$IMAGE_VERSION
# docker pull nginx
