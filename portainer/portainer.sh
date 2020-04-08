#!/usr/bin/env bash
base_path=~/docker/data/portainer
container_name=portainer
port=9000

mkdir -p $base_path/data
docker run -itd -p $port:9000 --name $container_name --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v $base_path/data:/data portainer/portainer
