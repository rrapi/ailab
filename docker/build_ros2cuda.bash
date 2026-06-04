#!/bin/bash

UPAR="--build-arg UID=`id -u` --build-arg GID=`id -g`"

IMAGENAME=ros2_jazzy_cuda

DOCKERFILE=Dockerfile.ros2cuda

echo "====================================="
echo "   Building $IMAGENAME  "
echo "====================================="

docker build $UPAR -t $IMAGENAME -f $DOCKERFILE .
