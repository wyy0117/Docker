#!/usr/bin/env bash
base_path=~/docker/data/es/es02
port1=9202
port2=9302
container_name=es02

mkdir -p $base_path/{config,logs,data}
mkdir -p $base_path/../es-backup

cp ./custom-elasticsearch.yml $base_path/config/.
cp ./jvm.options $base_path/config/.

docker run --ulimit memlock=-1:-1 -d \
  -p $port1:$port1 \
  -p $port2:$port2 \
  -v $base_path/config/custom-elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml \
  -v $base_path/config/jvm.options:/usr/share/elasticsearch/config/jvm.options \
  -v $base_path/data:/usr/share/elasticsearch/data \
  -v $base_path/../es-backup:/usr/share/elasticsearch/es-backup \
  -v $base_path/logs:/usr/share/elasticsearch/logs \
  --name $container_name \
  docker.elastic.co/elasticsearch/elasticsearch:5.5.3
