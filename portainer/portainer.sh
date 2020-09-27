#!/usr/bin/env bash
base_path=~/docker/portainer
container_name=portainer
#edge agent port
tunnelport=8001
#浏览器中查看页面的端口号
uiport=9001

mkdir -p $base_path/data
docker run -itd -p $tunnelport:$tunnelport -p $uiport:9000 --name $container_name --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v $base_path/data:/data portainer/portainer --tunnel-port=$tunnelport
