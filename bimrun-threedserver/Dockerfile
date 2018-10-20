# 0.1 add tomcat log and application data mapping.

FROM tomcat:8.5-jre8

# create data folder
RUN mkdir -p /var/data

# value
VOLUME [ "/usr/local/tomcat/logs","/var/data" ]

EXPOSE 8080
CMD ["catalina.sh", "run"]