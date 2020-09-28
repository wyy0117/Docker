#!/usr/bin/env bash
base_path=/data/bimgroupdev/mysql5.7
port=3309
container_name=bimdevmysql
root_password=root

mkdir -p $base_path/{conf,dbdata}
cp ./config-file.cnf $base_path/conf/.

docker run -itd --restart=always --name $container_name \
  -p $port:3306 \
  -v $base_path/conf:/etc/mysql/conf.d \
  -v $base_path/dbdata:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=$root_password \
  mysql:5.7
