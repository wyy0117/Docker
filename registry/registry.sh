#!/usr/bin/env bash

base_path=/home/wyy/docker/data/registry
container_name=registry
port=5000

mkdir -p $base_path/{config,registry}
cp ./config.yml $base_path/config/.

docker run -d \
  -p $port:5000 \
  --restart=always \
  --name $container_name \
  -v $base_path/registry:/var/lib/registry \
  -v $base_path/config/config.yml:/etc/docker/registry/config.yml \
  registry
