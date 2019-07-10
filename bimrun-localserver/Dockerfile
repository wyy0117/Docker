FROM openjdk:8-jre-stretch

RUN echo 'Asia/Shanghai' > /etc/timezone

WORKDIR /app
VOLUME /app/tmp /app/logs /app/data

COPY ./target/*.war app.war

EXPOSE 8080

# start app
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.war"]
