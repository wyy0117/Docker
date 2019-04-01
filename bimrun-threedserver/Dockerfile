FROM tomcat:8.5-jre8

# create data folder
RUN mkdir -p /var/{data,workspace}

# add debug
RUN echo "CATALINA_OPTS=\"\$CATALINA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8085\"">/usr/local/tomcat/bin/setenv.sh

# value
VOLUME ["/var/data","/var/workspace", "/usr/local/tomcat/logs","/usr/local/tomcat/webapps/ROOT"]

EXPOSE 8080 8085
CMD ["catalina.sh", "run"]
