FROM ubuntu:18.04

WORKDIR /root/

# install cmake
RUN apt-get update && \
    apt-get install -y build-essential wget unzip libssl-dev && \
    wget https://github.com/Kitware/CMake/releases/download/v3.22.0/cmake-3.22.0.tar.gz && \
    tar -xf cmake-3.22.0.tar.gz && \
    rm cmake-3.22.0.tar.gz && \
    cd cmake-3.22.0 && \
    ./bootstrap && \
    make -j$(nproc) && \
    make install

# install libtorch
RUN wget https://download.pytorch.org/libtorch/cu117/libtorch-cxx11-abi-shared-with-deps-2.0.0%2Bcu117.zip && unzip libtorch-cxx11-abi-shared-with-deps-2.0.0+cu117.zip

# install vim
RUN apt-get install -y vim


ENV CUDA_HOME /usr/local/cuda
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/cuda/lib64:/usr/local/cuda/extras/CUPTI/lib64
ENV PATH $PATH:$CUDA_HOME/bin