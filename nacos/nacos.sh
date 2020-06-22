#!/usr/bin/env bash
base_path=/Users/wyy/docker/data/nacos
port=8848
container_name=nacos
mysql_host=192.168.10.90
mysql_port=3306
mysql_username=easyray
mysql_password=easyray
mysql_db=easyray

mkdir -p $base_path/{logs,init.d}
cp ./custom.properties $base_path/init.d/.

docker run --restart always -d \
--name $container_name \
-v $base_path/logs:/home/nacos/logs \
-v $base_path/init.d/custom.properties:/home/nacos/init.d/custom.properties \
-e MODE=standalone \
-e SPRING_DATASOURCE_PLATFORM=mysql \
-e MYSQL_SERVICE_HOST=$mysql_host \
-e MYSQL_SERVICE_DB_NAME=$mysql_db \
-e MYSQL_SERVICE_PORT=$mysql_port \
-e MYSQL_SERVICE_USER=$mysql_username \
-e MYSQL_SERVICE_PASSWORD=$mysql_password \
-p $port:8848 \
nacos/nacos-server:latest
