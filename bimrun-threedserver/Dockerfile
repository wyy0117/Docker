FROM tomcat:8.5-jre8

# create data folder
RUN mkdir -p /var/data

# value
VOLUME [ "/usr/local/tomcat/logs","/var/data","/usr/local/tomcat/webapps/ROOT"]

EXPOSE 8080
CMD ["catalina.sh", "run"]
