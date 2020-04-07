FROM openjdk:8-jre-stretch
RUN echo 'Asia/Shanghai' > /etc/timezone
WORKDIR /app
VOLUME /app/tmp /app/logs
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]
