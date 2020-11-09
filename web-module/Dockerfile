FROM tomcat:8.5.38-jre8-slim
MAINTAINER 313DEVGRP <313@313.co.kr>

RUN rm -rf /usr/local/tomcat/webapps/ROOT
ARG JAR_FILE
ADD target/${JAR_FILE} /usr/local/tomcat/webapps/ROOT.war

ARG SCOUTER_FILE
ADD target/${SCOUTER_FILE} /usr/local/tomcat/lib/scouter.agent.jar

ARG SCOUTER_CONF
ADD target/${SCOUTER_CONF} /usr/local/tomcat/conf/scouter.conf

ENV JAVA_OPTS="-javaagent:/usr/local/tomcat/lib/scouter.agent.jar -Dscouter.config=/usr/local/tomcat/conf/scouter.conf -Dobj_name=www313cokr"

RUN apt-get update
RUN apt-get -y -q install libpcap0.8 wget

RUN wget http://www.313.co.kr/nexus/content/repositories/StandardProject/313devgrp/packetbeat/7.4.2-linux/packetbeat-7.4.2-linux-x86_64.tar.gz
RUN tar zxvf packetbeat-7.4.2-linux-x86_64.tar.gz
ADD packetbeat-7.4.2-linux.yml ./packetbeat-7.4.2-linux-x86_64/packetbeat.yml

ADD docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]