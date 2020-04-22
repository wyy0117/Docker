#!/usr/bin/env bash

base_path=~/docker/data/httpserver
container_name=httpserver
port=80

mkdir -p $base_path/{conf,html}
cp ./nginx.conf $base_path/conf/.

docker run -itd --restart=always --name $container_name -p $port:80 -v $base_path/conf/nginx.conf:/etc/nginx/nginx.conf -v $base_path/html:/usr/share/nginx/html nginx
