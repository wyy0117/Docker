#!/usr/bin/env bash
base_path=~/docker/data/kibana/
container_name=kibana
port=5601

mkdir -p $base_path/config

cp ./kibana.yml $base_path/config/.

docker run -itd --name $container_name -p $port:5601 -v $base_path/config/kibana.yml:/usr/share/kibana/config/kibana.yml docker.elastic.co/kibana/kibana:5.5.3
