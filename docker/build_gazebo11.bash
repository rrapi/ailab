#!/bin/bash

UPAR="--build-arg UID=`id -u` --build-arg GID=`id -g`"

IMAGENAME=ros_noetic_gazebo

DOCKERFILE=Dockerfile

echo "====================================="
echo "   Building $IMAGENAME  "
echo "====================================="

docker build $UPAR -t $IMAGENAME -f $DOCKERFILE .
