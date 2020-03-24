#!/usr/bin/env bash
mkdir -p ~/docker/data/fastdfs/storage1/{data,store_path} \
&& docker run -itd --name fastdfs-storage1 -p 22124:22122 -v ~/docker/data/fastdfs/storage1/data:/fastdfs/storage/data -v ~/docker/data/fastdfs/storage1/store_path:/fastdfs/store_path -e TRACKER_SERVER:192.168.31.50:22122 -e TRACKER_SERVER:192.168.31.50:22123 season/fastdfs storage \
&& mkdir -p ~/docker/data/fastdfs/storage2/{conf,data,store_path} \
&& docker run -itd --name fastdfs-storage2 -p 22125:22122 -v ~/docker/data/fastdfs/storage2/data:/fastdfs/storage/data -v ~/docker/data/fastdfs/storage2/store_path:/fastdfs/store_path -e TRACKER_SERVER:192.168.31.50:22122 -e TRACKER_SERVER:192.168.31.50:22123 season/fastdfs storage \
&& mkdir -p ~/docker/data/fastdfs/storage3/{conf,data,store_path} \
&& docker run -itd --name fastdfs-storage3 -p 22126:22122 -v ~/docker/data/fastdfs/storage3/data:/fastdfs/storage/data -v ~/docker/data/fastdfs/storage3/store_path:/fastdfs/store_path -e TRACKER_SERVER:192.168.31.50:22122 -e TRACKER_SERVER:192.168.31.50:22123 season/fastdfs storage \
