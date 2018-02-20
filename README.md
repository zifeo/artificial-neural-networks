# Artificial Neural Networks

[![Docker Build Status](https://img.shields.io/docker/build/zifeo/artificial-neural-networks.svg)](https://hub.docker.com/r/zifeo/artificial-neural-networks/)

Throughout the semester, we will use [Keras](https://keras.io) with its [Tensorflow](https://www.tensorflow.org) backend in pratical exercices and mini-projects.
Due to the differences between platforms, we provide an all-in-one docker notebook image in two flavours.
In case you own a [CUDA-enabled gpu](https://developer.nvidia.com/cuda-gpus) on GNU/Linux you can take advantage of the `gpu` version, otherwise the `cpu` version will do the job.

Although we do not support it, you can as well create your own setup using local installations or [virtualenv](https://virtualenv.pypa.io/en/stable/).
However your assignements should run fine with the same configuration and within the image:

- python 3.5
- Keras==2.1.4
- tensorflow==1.5.0 

## Getting started

[Docker](https://www.docker.com) provide operating-system-level virtualization, i.d. light and easy to use containers for running self-contained software.
First, you will need to install Docker CE (=community edition, make sure you do not install Docker EE):

- Mac: [instructions](https://docs.docker.com/docker-for-mac/install/) or [direct download](https://download.docker.com/mac/stable/Docker.dmg)
- Ubuntu: [instructions](https://docs.docker.com/install/linux/docker-ce/ubuntu/)
- Debian: [instructions](https://docs.docker.com/install/linux/docker-ce/debian/)
- Windows: [instructions](https://docs.docker.com/docker-for-windows/install/) or [direct download](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe)

## CPU version

Once Docker is installed, you can test your setup:

```shell
docker run --rm zifeo/artificial-neural-networks:cpu python3 -c 'import keras; print(keras.__version__)'
# Using TensorFlow backend.
# 2.1.4
```

Then, you can start the notebook server and access [localhost:8888](http://localhost:8888).

```shell
# to start
docker run \
  --rm \ # the container will remove itself upon termination
  -d \ # the container will detach itself and run in background
  --name ann \ # you can access live logs with `docker logs ann -f`
  -p 8888:8888 \ # bind local to docker port
  -v $(pwd):/jupyter \ # bind current directory `pwd` to docker internal folder '/jupyter'
  zifeo/artificial-neural-networks:cpu # name of the image we are using

# one-liner
docker run --rm -d --name ann -p 8888:8888 -v $(pwd):/jupyter zifeo/artificial-neural-networks:cpu 

# to stop after usage
docker stop ann
```

Be carefull to use the volume mapping (-v) to a specified folder, otherwise you work will be destroyed when stopping the notebook server.

## GPU version

This flavour is slightly tricker and require Nvidia docker engine utility to be installed ([instructions](https://github.com/NVIDIA/nvidia-docker)).

```shell
# to test
docker run --runtime=nvidia --rm zifeo/artificial-neural-networks:gpu nvidia-smi

# to start
docker run --runtime=nvidia --rm -d --name ann -p 8888:8888 -v $(pwd):/jupyter zifeo/artificial-neural-networks:gpu

# to stop after usage
docker stop ann
```

## Security notes

This image does not include any security mechanism and thus should not be used in a open environment (e.g. public server or untrusted network) without adequat protection.


