#!/usr/bin/env bash
base_path=~/docker/data/portainer1
container_name=portainer1
#edge agent port
tunnelport=8002
#浏览器中查看页面的端口号
uiport=8481

mkdir -p $base_path/data
docker run -itd \
  -p $tunnelport:$tunnelport \
  -p $uiport:9000 \
  --name $container_name \
  --restart=always \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $base_path/data:/data \
  portainer/portainer-ce --tunnel-port=$tunnelport
