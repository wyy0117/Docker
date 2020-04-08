#!/usr/bin/env bash

base_path=~/docker/data/grafana
container_name=grafana
port=3000

mkdir -p $base_path/{data,conf}
cp ./grafana.ini $base_path/conf/.

docker run -d --restart=always -p $port:3000 --name $container_name --user root \
-v $base_path/data:/var/lib/grafana \
-v $base_path/conf/grafana.ini:/conf/grafana.ini \
grafana/grafana
