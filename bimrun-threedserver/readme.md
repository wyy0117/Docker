this image is a tomcat8.5 and use jre8,you can mapping tomcat logs and some data out of container.
#### how to user it
1. run this image and get in,just cd to ROOT and use wget download your application.
1. or,you can add your local app folder mount to directory of "/usr/local/tomcat/webapps/ROOT"
1. run it.
    ```
    docker run --name threedserver -e JAVA_OPTS='-Xmx6g -Duser.timezone=GMT+08' -it -p 8280:8080 -v ~/threedserver/logs:/usr/local/tomcat/logs -v ~/threedserver/data:/var/data -v ~/threedserver/workspace:/var/workspace -v ~/threedserver/app:/usr/local/tomcat/webapps/ROOT -d threedserver:2.0
    ```
