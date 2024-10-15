# ARM Gazebo

This package contains files for Gazebo simulation for AILAB robotic arms.

# Setup

* [Install docker engine](https://docs.docker.com/engine/install/ubuntu/) (not docker desktop!!!) through apt (tested on v. 19.03, 20.10).

    Usually, this should work
    
        sudo apt install docker.io
    
    See also [Post-installation steps for Linux](https://docs.docker.com/install/linux/linux-postinstall/). In particular, add your user to the docker group and log out and in again, before proceeding.


* [Install docker-compose](https://docs.docker.com/compose/install/linux/#install-using-the-repository) (tested on v. 1.28)

    First remove any other `docker-compose` file, if present (check with `which docker-compose`)
    
    Download binay file for v. 1.28.5
    
        cd /usr/local/bin
        sudo wget https://github.com/docker/compose/releases/download/1.28.5/docker-compose-Linux-x86_64
        sudo mv docker-compose-Linux-x86_64 docker-compose
        sudo chmod a+x docker-compose
        docker-compose -v

 
* Nvidia Driver

    Install nvidia-docker2
  
    Install for Nvidia Container Toolkit, follow these [instructions](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)


* Additional Tools

      sudo apt install gawk


# Download docker images
In case you have already created a docker image previously and want to use the same one.
You can specify the images you need to download in `pull_images.bash` file, for example:

    docker pull <docker_image>

where `docker_image` is the docker path or name of the desired image. To do so, you can execute:

    cd docker
    ./pull_images.bash


# Build docker images
In case you modified the `Dockerfile` and want to build a new image.

    cd docker
    ./build_gazebo<*>.bash

where `<*>` must be substituted with the used gazebo version, for example `build_gazebo11.bash`.


# Run docker images
To start the docker containers, execute:

    cd docker
    ./run_gazebo<*>.bash [x11|nvidia|vnc]

where `<*>` must be substituted with the used gazebo version, for example `run_gazebo11.bash`.

`x11` default mode uses X11 server, `nvidia` if you have NVidia graphic card and you installed nvidia-docker, `vnc` if you have problems with other modes uses a virtual xserver accessible through a web browser at `http://localhost:3000/`

## Explanation of the startup procedure

The script `run_gazebo<*>.bash` use `docker-compose` to start the docker containers with the configuration given in the files `docker/dc_<*>_<#>.yml`, where `<#>` must be substituted with the runtime mode, for example `docker/dc_gazebo11_vnc.yml`.

To see the running docker containers, use the command

    docker ps

The container `simulation` is the one that is running the ARM gazebo simulation

The container is running a [tmux](https://github.com/tmux/tmux/wiki) session. You can attach to this session with the following command

    docker exec -it simulation tmux a

The container initialize the gazebo simulation by running the script `bin/init_sim.bash`.
In this script you can find the commands sent to the tmux server, in particular the following windows are created: 0) gazebo simulator, 1) moveit, 2) rviz (command prepared but not launched),
3) scripts to spawn objects.

Note: you can create additional tmux windows with `CTRL-b c`. You can detach from tmux with `CTRL-b d`


# Configure and spawn objects

Create a config file in `config` folder with objects described in this format

    <object_name> <type> <x> <y> <z> <yaw> <pitch> <roll>


Spawn objects from the docker container

First enter the docker container

    docker exec -it simulation tmux a

Then, issue the follwoing commands to manage objects in gazebo simulator

    cd ~/src/ailab/scripts
    python gazebo_objects.py -a <object config file>

For example:

    python gazebo_objects.py -a ../config/ARM1.txt

You can add more config files in the `config` folder

To reset a world, you can use the script

    ./reset_world.bash <object config file>

This script will first delete all the objects according to the patterns
in file `config/ARMd.txt` and then spawn the new objects in the specified
config file.

For example, this command will reset the world with the configuration `ARM1.txt`

    ./reset_world.bash ../config/ARM1.txt

For other interactions with gazebo objects, see a list of options with

    python gazebo_objects.py -h

    Options
    -h	help
    -l	list objects
    -m	list available models
    -a <obj> <type> <x> <y> <z> <yaw> <pitch> <roll>|<filename>	add an object or all objects in config file
    -d <obj>|<filename>	delete one object or all objects in config file
    -w	world properties
    -s <obj>	object properties and state


# Rviz visualization

From the docker container

    docker exec -it simulation tmux a

you can create a new tmux windows with `CTRL-b c` and then run

    cd ~/src/ailab/config
    rosrun rviz rviz -d robot_camera.rviz

You can detach from tmux with `CTRL-b d`

# Troubleshooting

* In case of errors due to existing containers, use this command to clean them

        docker container prune -f


# Simulation Images
Simulation of robot UR5e with Robotiq 2f_80 gripper and camera attached

![alt text](./images/gazebo_simulation_env.png?raw=true)
![alt text](./images/rviz_simulation_env_camera_view.png?raw=true)

