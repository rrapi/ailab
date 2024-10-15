if [ "$1" != "" ]; then
  ./init_sim_"$1".bash
else
  bash
fi
# elif [ "$1" == "ur5e" ]; then
#   SIM=init_sim_ur5e.bash
# fi

# $SIM
