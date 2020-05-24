This image is base on debian:stable-slim and provided java8 environment.
Put liferay home and tomcat logs out of the image.

#### how to use it
1. first of all pull the image.
1. create a folder named logs under your liferay home.    
1. run liferay,if you run it in development,you can add debug port(8085) mapping.
    ```
    docker run --rm -itd --name liferay6.2 -p 8080:8080 -v ${pwd}/liferay-home:/var/liferay-home -v ${pwd}/workspace:/var/workspace wyy349093330/liferay6.2-java8:$VERSION
    ```    
1. or you can use docker-compose
    ```
    docker-compose up -d --build --force-recreate
    ```
#### note
the default -Xmx=4g,if you want to resize it just do it like
```
docker run --rm -itd -e JAVA_OPTS='-Xmx6g' --name liferay6.2 -p 8080:8080 -v ${pwd}/liferay-home:/var/liferay-home -v ${pwd}/workspace:/var/workspace wyy349093330/liferay6.2-java8:$VERSION
```
#### build image
if you want to build the image by yourself,you should put the jre and liferay under folder before build.

---
#### the official image 
```
docker run -itd --name liferay6.2.5-official -p 8080:8080 -v ~/docker/data/liferay6.2.5-official/data:/opt/liferay/data -v ~/docker/data/liferay6.2.5-official/logs:/opt/liferay/logs -v ~/docker/data/liferay6.2.5-official/logs:/opt/liferay/tomcat/logs -v ~/docker/data/liferay6.2.5-official/deploy:/opt/liferay/deploy -v ~/docker/data/liferay6.2.5-official/portal-ext.properties:/opt/liferay/portal-ext.properties liferay/portal:6.2.5-ga6
```
