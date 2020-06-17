base_path=~/docker/data/zookeeper
port1=2181
port2=2888
port3=3888
container_name=zookeeper

mkdir -p $base_path/{data,datalog,logs}

echo 'dataDir=/data
dataLogDir=/datalog
clientPort=2181
'>$base_path/zoo.cfg
docker run --name $container_name --restart=always -itd \
-v $base_path/data:/data \
-v $base_path/datalog:/datalog \
-v $base_path/logs:/logs \
-v $base_path/zoo.cfg:/conf/zoo.cfg \
-e ZOO_LOG4J_PROP="INFO,ROLLINGFILE" \
-p $port1:2181 \
-p $port2:2888 \
-p $port3:3888 \
zookeeper
