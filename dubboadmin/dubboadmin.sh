#!/usr/bin/env bash

container_name=dubboadmin
port=8080
zookeeper_server=192.168.31.50:2181
root_password=root

docker run -itd --restart=always --name $container_name -p $port:8080 -e ZOOKEEPER_SERVER=$zookeeper_server -e ROOT_PASSWORD=$root_password webuilder/dubboadmin
