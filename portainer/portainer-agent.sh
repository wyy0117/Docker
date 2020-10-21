#!/usr/bin/env bash
base_path=/data/portainer-agent
container_name=portainer-agent
port=9001

mkdir -p $base_path

docker run -d \
  -p $port:9001 \
  --name $container_name \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /var/lib/docker/volumes:/var/lib/docker/volumes \
  portainer/agent
