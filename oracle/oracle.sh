#!/usr/bin/env bash

base_path=~/docker/data/oracle
container_name=oracle
port=1521

mkdir -p ~/base_path/data

docker run -itd --restart=always \
  --name=$container_name \
  -p $port:1521 \
  -e ORACLE_ALLOW_REMOTE=true \
  -v $base_path/data:/mnt \
  oracleinanutshell/oracle-xe-11g
