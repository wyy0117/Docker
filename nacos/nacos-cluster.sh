#!/usr/bin/env bash
#基本路径
base_path=/Users/wyy/docker/data/nacos3
#对外端口号
port=8851
#容器名
container_name=nacos3
#mysql的ip
mysql_host=192.168.99.240
#mysql的端口
mysql_port=3309
#mysql的用户名
mysql_username=wangyuyuan
#mysql的密码
mysql_password=wangyuyuan
#mysql的数据库的名字
mysql_db=wyy_nacos
#nacos启动在哪个ip上
nacos_server_ip=192.168.10.11
#nacos集群的ip地址
nacos_servers=192.168.10.11:8848,192.168.10.11:8849,192.168.10.11:8850,192.168.10.11:8851

mkdir -p $base_path/{logs,init.d,conf}
cp ./custom.properties $base_path/init.d/.
cp ./cluster.conf $base_path/conf/.

docker run --restart always -d \
--name $container_name \
-v $base_path/logs:/home/nacos/logs \
-v $base_path/init.d/custom.properties:/home/nacos/init.d/custom.properties \
-v $base_path/conf/cluster.conf:/home/nacos/conf/cluster.conf \
-e NACOS_SERVERS=$nacos_servers \
-e NACOS_SERVER_IP=$nacos_server_ip \
-e NACOS_SERVER_PORT=$port \
-e SPRING_DATASOURCE_PLATFORM=mysql \
-e MYSQL_SERVICE_HOST=$mysql_host \
-e MYSQL_SERVICE_DB_NAME=$mysql_db \
-e MYSQL_SERVICE_PORT=$mysql_port \
-e MYSQL_SERVICE_USER=$mysql_username \
-e MYSQL_SERVICE_PASSWORD=$mysql_password \
-p $port:8848 \
nacos/nacos-server:latest
