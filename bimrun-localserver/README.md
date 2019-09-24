this image is just for bimrun-localserver.Use jre-8u111.
#### how to user it
1. create a workspace directory,and copy war package to here.
1. run it
    ```
    docker run --rm -itd -e JAVA_OPTS='-Xmx1g -Duser.timezone=GMT+08' --name bimrun-localserver -p 8080:8080 -v ~/localserver:/var/workspace -t bimrun-localserver:1.0
    ```
