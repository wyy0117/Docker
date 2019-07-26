FROM debian:stable-slim

# install wget unzip
RUN apt-get update \
    && apt-get -y install unzip \
    && rm -rf /var/lib/apt/lists/*

# install jre
COPY jre-8u221-linux-x64.tar.gz /opt/.
RUN tar -zxvf /opt/jre-8u221-linux-x64.tar.gz -C /opt/ \
    && rm /opt/jre-8u221-linux-x64.tar.gz

ENV JRE_HOME /opt/jre1.8.0_221
ENV CLASSPATH $JRE_HOME/lib/rt.jar:$JRE_HOME/lib/ext
ENV PATH $PATH:$JRE_HOME/bin

# timezone
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# install liferay
 COPY liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip /opt
 RUN unzip /opt/liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip -d /opt \
 	&& rm /opt/liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip

#RUN wget http://downloads.sourceforge.net/project/lportal/Liferay%20Portal/6.2.5%20GA6/liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip \
# 	&& unzip liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip -d /opt \
# 	&& rm liferay-portal-tomcat-6.2-ce-ga6-20160112152609836.zip

# add config for start
RUN /bin/echo -e 'CATALINA_OPTS="$CATALINA_OPTS -Dfile.encoding=UTF8 -Djava.net.preferIPv4Stack=true  -Dorg.apache.catalina.loader.WebappClassLoader.ENABLE_CLEAR_REFERENCES=false -Duser.timezone=GMT+08 -Xmx4096m" \nCATALINA_OPTS="$CATALINA_OPTS -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=8085" '>/opt/liferay-portal-6.2-ce-ga6/tomcat-7.0.62/bin/setenv.sh

# add bundle property
RUN /bin/echo -e 'liferay.home=/var/liferay-home \ninclude-and-override=/var/liferay-home/portal-ext.properties'>/opt/liferay-portal-6.2-ce-ga6/portal-bundle.properties

# delete tomcat logs folder , add tomcat logs link
RUN rm -rf /opt/liferay-portal-6.2-ce-ga6/tomcat-7.0.62/logs/ \
&& ln -s /var/liferay-home/logs /opt/liferay-portal-6.2-ce-ga6/tomcat-7.0.62/ \
&& ln -s /var/liferay-home/portal-setup-wizard.properties /opt/liferay-portal-6.2-ce-ga6/

# add liferay workspace folder
RUN mkdir -p /var/workspace

# volumes
VOLUME ["/var/liferay-home","/var/workspace"]

# Ports
EXPOSE 8080 8085

ENV LANG C.UTF-8

# EXEC
CMD ["run"]
ENTRYPOINT ["/opt/liferay-portal-6.2-ce-ga6/tomcat-7.0.62/bin/catalina.sh"]
