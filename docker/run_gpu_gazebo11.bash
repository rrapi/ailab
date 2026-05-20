#!/bin/bash

export AILAB_DIR=`pwd | gawk '{ print gensub(/\/docker/, "", 1) }'`

DC=dc_g11_nvidia_vnc.yml

if [ "$1" == "x11" ]; then
  DC=dc_g11_nvidia_x11.yml
elif [ "$1" == "vnc" ]; then
  DC=dc_g11_nvidia_vnc.yml
fi

docker compose -f $DC up

