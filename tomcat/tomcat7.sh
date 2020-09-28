#!/usr/bin/env bash

base_path=/data/ctlbim/tomcat
container_name=ctlbim-tomcat
port=8059

mkdir -p $base_path/{deploysite,logs}

echo 'Asia/Shanghai' > /$base_path/timezone

docker run -itd --restart=always \
--name=$container_name \
-p $port:8080 \
-v $base_path/deploysite:/usr/local/tomcat/webapps/ROOT \
-v $base_path/logs:/usr/local/tomcat/logs \
-v $base_path/timezone:/etc/timezone \
tomcat:7-jdk8


