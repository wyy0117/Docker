#!/usr/bin/env bash
base_path=~/cache/docker/data/python
container_name=python-web
port=5000

chmod +x $base_path/start.sh

docker run -it --restart=always \
  --name $container_name \
   -v $base_path:/opt \
   -p $port:5000 \
    python:3 \
   sh /opt/start.sh
