#!/usr/bin/env bash
base_path=/data/localserver
image_name=localserver
container_name=localserver
port=8080
spring_profile_active=prod

mkdir -p $base_path/{logs,tmp}

docker build -t $image_name .

docker run -itd --name $container_name --restart=always \
-v $base_path:/app \
-v $base_path/logs:/app/logs \
-v $base_path/tmp:/app/tmp \
-e SPRING_PROFILES_ACTIVE=$spring_profile_active \
-p $port:8080 $image_name

