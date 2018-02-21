# Advanced usage

The following is not needed to successfully achieve exercices and mini-projets but might be of interests to some of you.

## GPU version

This flavour is slightly tricker and require [Nvidia docker engine utility](https://github.com/NVIDIA/nvidia-docker) to be installed ([instructions](https://github.com/NVIDIA/nvidia-docker/wiki/Installation-(version-2.0))).

```shell
# test
docker run --runtime=nvidia --rm zifeo/artificial-neural-networks:gpu nvidia-smi

# start ($(pwd) should be replaced by %cd% or ${PWD} on Windows)
docker run --runtime=nvidia --rm -d --name ann -p 8888:8888 -v $(pwd):/jupyter zifeo/artificial-neural-networks:gpu

# stop
docker stop ann
```

## Tensorboard

This image also includes an embedded version of [Tensorboard](https://www.tensorflow.org/programmers_guide/summaries_and_tensorboard) which can be spawn from the *new menu*. It should spawn a new board on [localhost:8888/tensorboard/1](http://localhost:8888/tensorboard/1) (for board 1) looking for logs in the current notebook directory. If nothing shows up after creating one, you can access it from the *running tab*.

![](screens/4.png)