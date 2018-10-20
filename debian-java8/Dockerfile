FROM debian:wheezy

# to avoid 'debconf: unable to initialize frontend: Dialog'
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
    && apt-get install -y curl tar \
    && (curl -s -k -L -C - -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz | tar xfz - -C /opt) \
    && mv /opt/jdk1.8.0_191/jre /opt/jre1.8.0_191 \
    && mv /opt/jdk1.8.0_191/lib/tools.jar /opt/jre1.8.0_191/lib/ext \
    && rm -rf /opt/jdk1.8.0_191 \
    && ln -s /opt/jre1.8.0_191 /opt/java \
    && rm -rf /var/lib/apt/lists/*