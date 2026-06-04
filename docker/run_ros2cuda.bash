#!/bin/bash

# In X11 case, before running docker compose up, you must give local applications permission to connect to your X11 screen: xhost +local:root

export AILAB_DIR=`pwd | gawk '{ print gensub(/\/docker/, "", 1) }'`

DC=dc_ros2cuda_vnc.yml

if [ "$1" == "x11" ]; then
  DC=dc_g11_gpu_x11.yml
elif [ "$1" == "vnc" ]; then
  DC=dc_g11_gpu_vnc.yml
fi

docker compose -f $DC up

