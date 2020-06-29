#!/usr/bin/env bash

base_path=/Users/wyy/home/docker/data/seata
container_name=seata
port=8091
seata_ip=192.168.1.10

./nacos-config.sh

mkdir -p $base_path/conf

cp registry.conf $base_path/conf/.

docker run --name seata-server -itd --restart=always \
  --name $container_name \
  -p $port:8091 \
  -e SEATA_CONFIG_NAME=file:/root/seata-config/registry \
  -e SEATA_IP=$seata_ip \
  -v $base_path/conf:/root/seata-config \
  seataio/seata-server
