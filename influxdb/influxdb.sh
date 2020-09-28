#!/usr/bin/env bash

base_path=/data/influxdb
container_name=influxdb
port1=8086
port2=8088

mkdir -p $base_path/{data,conf}
cp ./influxdb.conf $base_path/conf/.

docker run -itd --restart=always --name $container_name -v $base_path/data:/var/lib/influxdb -v $base_path/conf/influxdb.conf:/etc/influxdb/influxdb.conf -p $port1:8086 -p $port2:8088 influxdb:1.5

