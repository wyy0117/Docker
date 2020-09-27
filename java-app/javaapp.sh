#!/usr/bin/env bash
base_path=~/cache/temp/demo/target
container_name=demo
port=8080
spring_profile_active=production

mkdir -p $base_path

docker run -itd --name $container_name --restart=always \
  -v $base_path:/app \
  -e SPRING_PROFILES_ACTIVE=$spring_profile_active \
  -p $port:$port \
  wyy349093330/javaapp:jre8
