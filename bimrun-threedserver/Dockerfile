FROM tomcat:8.5-jre8

# create data folder
RUN mkdir -p /var/{data,workspace}

# value
VOLUME ["/var/data","/var/workspace", "/usr/local/tomcat/logs","/usr/local/tomcat/webapps/ROOT"]

EXPOSE 8080
CMD ["catalina.sh", "run"]
