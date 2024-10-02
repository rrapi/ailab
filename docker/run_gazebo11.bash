#!/bin/bash

export AILAB_DIR=`pwd | gawk '{ print gensub(/\/docker/, "", 1) }'`

DC=dc_g11_x11.yml

if [ "$1" == "nvidia" ]; then
  DC=dc_g11_nvidia.yml
elif [ "$1" == "vnc" ]; then
  DC=dc_g11_vnc.yml
fi

docker-compose -f $DC  up

