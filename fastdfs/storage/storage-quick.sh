#!/usr/bin/env bash
base_path=/data/fastdfs/storage
container_name=fastdfs-storage

mkdir -p $base_path/{conf,dfs}
cp ./storage.conf.sample $base_path/conf/storage.conf
cp ./mod_fastdfs.conf $base_path/conf/.
cp ./http.conf $base_path/conf/.
cp ./mime.types $base_path/conf/.
cp ./nginx.conf $base_path/conf/.

docker run -itd --restart=always --name $container_name --network=host \
-v $base_path/conf/storage.conf:/etc/fdfs/storage.conf \
-v $base_path/conf/mod_fastdfs.conf:/etc/fdfs/mod_fastdfs.conf \
-v $base_path/conf/http.conf:/etc/fdfs/http.conf \
-v $base_path/conf/mime.types:/etc/fdfs/mime.types \
-v $base_path/conf/nginx.conf:/usr/local/nginx/conf/nginx.conf \
-v $base_path/dfs:/home/dfs \
-v $base_path/dfs/logs:/usr/local/nginx/logs wyy349093330/fastdfs-storage:6.06


