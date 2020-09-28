FROM openjdk:8-jre as jre

FROM tianon/wine:latest
RUN mkdir -p /usr/local
COPY --from=jre /usr/local/openjdk-8 /usr/local/.
ENV JRE_HOME /usr/local/openjdk-8
ENV CLASSPATH $JRE_HOME/lib/rt.jar:$JRE_HOME/lib/ext
ENV PATH $PATH:$JRE_HOME/bin

RUN echo 'Asia/Shanghai' > /etc/timezone
