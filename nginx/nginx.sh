#!/usr/bin/env bash

base_path=~/cache/docker/data/nginx
port=80
container_name=nginx

mkdir -p $base_path/{conf,log}
cp ./nginx.conf $base_path/conf/.
docker run -itd --restart=always \
  --name=$container_name \
  -p $port:80 \
  -v $base_path/conf/nginx.conf:/etc/nginx/nginx.conf \
  -v $base_path/log:/var/log/nginx \
nginx
