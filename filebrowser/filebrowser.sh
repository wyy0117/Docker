base_path=/Users/wyy/docker/data/filebrowser
container_name=filebrowser
port=9001
root_path=/Users/wyy

mkdir -p $base_path
cp ./.filebrowser.json $base_path/.
touch $base_path/filebrowser.db

docker run -itd --restart=always \
  --name $container_name \
  -v $root_path:/srv \
  -v $base_path/.filebrowser.json:/.filebrowser.json \
  -v $base_path/filebrowser.db:/database.db \
  -p $port:80 \
  filebrowser/filebrowser
