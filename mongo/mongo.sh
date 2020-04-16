#!/usr/bin/env bash
base_path=~/docker/data/mongo
container_name=mongo
port=27017

mkdir -p $base_path/dbdata

docker run -itd --restart=always --name $container_name -p $port:27017 -v $base_path/dbdata:/data/db  mongo:3.4
