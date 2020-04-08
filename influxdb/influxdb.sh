#!/usr/bin/env bash

base_path=~/docker/data/influxdb
container_name=influxdb
port=8086

mkdir -p $base_path/{data,conf}
cp ./influxdb.conf $base_path/conf/.

docker run -itd --restart=always --name $container_name -v $base_path/data:/var/lib/influxdb -v $base_path/conf/influxdb.conf:/etc/influxdb/influxdb.conf -p $port:8086 influxdb:1.5

