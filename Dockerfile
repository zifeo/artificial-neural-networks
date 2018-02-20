FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04

ENV LANG C.UTF-8
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:${LD_LIBRARY_PATH}

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        software-properties-common \
        build-essential \
        git \
        wget \
        curl \
        vim \
        libopenblas-base \
        python-dev \
        python3-dev \
        python3-pip \
        python3-setuptools \
        python3-wheel && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip3 install --upgrade pip && \
    pip3 --no-cache-dir install --upgrade \
        numpy \
        scipy \
        matplotlib \
        seaborn \
        pandas \
        h5py \
        graphviz \         
        pydot \
        pyaml \
        tqdm \
        tensorboard \
        https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow_cpu-1.5.0-cp35-cp35m-linux_x86_64.whl \
        keras \
        jupyter \
        jupyter-tensorboard

RUN python3 -c 'import tensorflow; print(tensorflow.__version__)' && \
        pip3 freeze

WORKDIR /juypter

ENTRYPOINT jupyter
CMD notebook --ip=0.0.0.0 --allow-root --no-browser

