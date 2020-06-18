#!/usr/bin/env bash
base_path=/data/fastdfs/tracker
container_name=fastdfs-tracker

mkdir -p $base_path/{conf,dfs}
cp ./tracker.conf.sample $base_path/conf/tracker.conf

docker run -itd --restart=always --name $container_name --network=host -v $base_path/conf/tracker.conf:/etc/fdfs/tracker.conf -v $base_path/dfs:/home/dfs wyy349093330/fastdfs-tracker:6.06
