# 0.1:add jre.
# 0.2:delete curl tar packages.

FROM debian:wheezy

RUN apt-get update \
    && apt-get install -y curl tar \
    && (curl -s -k -L -C - -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u171-b11/512cd62ec5174c3487ac17c61aaa89e8/jdk-8u171-linux-x64.tar.gz | tar xfz - -C /opt) \
    && mv /opt/jdk1.8.0_171/jre /opt/jre1.8.0_171 \
    && mv /opt/jdk1.8.0_171/lib/tools.jar /opt/jre1.8.0_171/lib/ext \
    && rm -rf /opt/jdk1.8.0_171 \
    && ln -s /opt/jre1.8.0_171 /opt/java \
    && rm -rf /var/lib/apt/lists/*