# Setup

- [Install docker engine](https://docs.docker.com/engine/install/ubuntu/) (not docker desktop!!!) through apt (tested on v. 19.03, 20.10).

Usually, this should work

    sudo apt install docker.io

See also [Post-installation steps for Linux](https://docs.docker.com/install/linux/linux-postinstall/). In particular, add your user to the docker group and log out and in again, before proceeding.


- [Install docker-compose](https://docs.docker.com/compose/install/linux/#install-using-the-repository) ((tested on v. 1.28))

First remove any other 'docker-compose' file, if present (check with 'which docker-compose')

Download binay file for v. 1.28.5

    cd /usr/local/bin
    sudo wget https://github.com/docker/compose/releases/download/1.28.5/docker-compose-Linux-x86_64
    sudo mv docker-compose-Linux-x86_64 docker-compose
    sudo chmod a+x docker-compose
    docker-compose -v

 

- Install For Nvidia docker, follow these [instructions](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html)


# Download/build docker images

## ROS kinetic + gazebo 7

    cd pg_lab
    ./pull_images.bash


## ROS melodic + gazebo 9

    cd pg_lab/docker
    ./build_gazebo9.bash