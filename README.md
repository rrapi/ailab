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

    docker pull docker_image

where `docker_image` is the docker path of the desired image
    

## ROS noetic + gazebo 11

    cd docker
    ./pull_images.bash


# Build docker images
In case you modified the `Dockerfile` and want to build a new image.

## ROS noetic + gazebo 11

    cd docker
    ./build_gazebo11.bash


# Run docker images

## ROS noetic + gazebo 11

    cd docker
    ./run_gazebo11.bash [x11|nvidia|vnc]

`x11` default mode uses X11 server, `nvidia` if you have NVidia graphic card and you installed nvidia-docker, `vnc` if you have problems with other modes uses a virtual xserver accessible through a web browser at `http://localhost:3000/`
