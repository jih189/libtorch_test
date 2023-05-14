#!/bin/bash
docker run -v $PWD/example:/root/libtorch-example \
	-e DISPLAY=":1" \
	-e QT_X11_NO_MITSHM=1 \
	-e XAUTHORITY \
	-e NVIDIA_DRIVER_CAPABILITIES=all \
	--ipc=host \
	--gpus all \
	--network="host" \
	-p 8888:8888 \
	--privileged=true \
	-v /etc/localtime:/etc/localtime:ro \
	-v /usr/local/cuda:/usr/local/cuda \
	-v "/tmp/.X11-unix:/tmp/.X11-unix:rw" -p 19997:19997 -it libtorch-test bash
