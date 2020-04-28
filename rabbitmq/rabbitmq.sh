#!/usr/bin/env bash
base_path=~/docker/data/rabbitmq/
container_name=rabbitmq
port1=5672
port2=15672
username=admin
password=admin

mkdir -p $base_path

docker run -itd --restart=always --name $container_name -v $base_path:/var/lib/rabbitmq -p $port1:5672 -p $port2:15672 -e RABBITMQ_DEFAULT_USER=$username -e RABBITMQ_DEFAULT_PASS=$password rabbitmq:3-management
