#!/usr/bin/env bash
base_path=/Users/wyy/docker/portainer
container_name=portainer
port1=8000
port2=9000

mkdir -p $base_path/data
docker run -itd -p $port1:8000 -p $port2:9000 --name $container_name --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v $base_path/data:/data portainer/portainer
