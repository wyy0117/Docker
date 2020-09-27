#!/usr/bin/env bash
base_path=/Users/wyy/cache/temp/demo/target
image_name=demo
container_name=demo
port=8080
spring_profile_active=production

mkdir -p $base_path

docker build -t $image_name .

docker run -itd --name $container_name --restart=always \
  -v $base_path:/app \
  -e SPRING_PROFILES_ACTIVE=$spring_profile_active \
  -p $port:$port \
  $image_name
