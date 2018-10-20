This image is base on wyy349093330/debian-java8,which provided java8 environment.Put liferay home and tomcat logs out of the image.

#### build detail
1. install wget,unzip
1. install liferay,you can install from local source file or download from official network.
1. config tomcat's setenv.sh,set Xmx=4096m,timezone=GMT+08,add debug port(8085).
1. add bundle property file

#### how to use it
1. first of all pull the image.
1. create a folder named logs under your liferay home.    
1. run liferay,if you run it in development,you can add debug port(8085) mapping.
    ```
    docker run --rm -itd --name liferay6.2 -p 8080:8080 -v ${pwd}/liferay-home:/var/liferay-home wyy349093330/liferay6.2-java8:${version} 
    ```    


