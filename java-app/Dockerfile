FROM openjdk:8-jre-stretch
RUN echo 'Asia/Shanghai' > /etc/timezone
WORKDIR /app
COPY ./start.sh /home/.
ENTRYPOINT ["/home/start.sh"]
