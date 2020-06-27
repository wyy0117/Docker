#!/usr/bin/env bash

base_path=/Volumes/home/docker/data/redis
container_name=redis
port=6379

mkdir -p $base_path/{conf,data}
cp ./redis.conf $base_path/conf/.

docker run -itd -p $port:6379 --name $container_name -v $base_path/conf/redis.conf:/usr/local/etc/redis/redis.conf -v $base_path/data:/data redis

