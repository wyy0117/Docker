#!/usr/bin/env bash
base_path=~/docker/data/mysql5.7
port=3306
container_name=mysql
root_password=root



mkdir -p $base_path/{conf,dbdata}
cp ./config-file.cnf $base_path/conf/.

docker run -itd --restart=true --name $container_name -p $port:3306 -v $base_path/conf:/etc/mysql/conf.d -v $base_path/dbdata:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=$root_password mysql:5.7
