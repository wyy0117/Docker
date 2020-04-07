basepath=/data/localserver
imagename=localserver
containername=localserver

mkdir -p $basepath/{logs,tmp}

docker build -t $imagename .

mkdir -p $basepath/{logs,tmp}

docker build -t $imagename .

docker run -itd --name $containername --restart always \
-v $basepath:/app \
-v $basepath/logs:/app/logs \
-v $basepath/tmp:/app/tmp \
-p 9020:8080 $imagename

