# 0.1:add run war package.

FROM airdock/oracle-jdk:jre-8u111

# workspace
RUN mkdir -p /var/workspace

WORKDIR /var/workspace

EXPOSE 8080

# start app
ENTRYPOINT java -jar /var/workspace/*.war