#!/bin/ba

SIM=init_sim_ur5e.bash

if [ "$1" == "panda" ]; then
  SIM=init_sim_panda.bash
fi

$SIM