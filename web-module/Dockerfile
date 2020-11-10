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

RUN wget http://www.313.co.kr/nexus/content/groups/public/313devgrp/packetbeat/7.4.2-linux/packetbeat-7.4.2-linux-x86_64.tar.gz
RUN tar zxvf packetbeat-7.4.2-linux-x86_64.tar.gz
ADD packetbeat.yml ./packetbeat-7.4.2-linux-x86_64/packetbeat.yml

RUN wget http://www.313.co.kr/nexus/content/groups/public/313devgrp/topbeat/1.3.1/topbeat-1.3.1-x86_64.tar.gz
RUN tar zxvf topbeat-1.3.1-x86_64.tar.gz
ADD topbeat.yml ./topbeat-1.3.1-x86_64/topbeat.yml

RUN wget http://www.313.co.kr/nexus/content/groups/public/313devgrp/metricbeat/7.4.2-linux/metricbeat-7.4.2-linux-x86_64.tar.gz
RUN tar zxvf metricbeat-7.4.2-linux-x86_64.tar.gz
ADD metricbeat.yml ./metricbeat-7.4.2-linux-x86_64/metricbeat.yml

RUN wget http://www.313.co.kr/nexus/content/groups/public/313devgrp/heartbeat/7.4.2-linux/heartbeat-7.4.2-linux-x86_64.tar.gz
RUN tar zxvf heartbeat-7.4.2-linux-x86_64.tar.gz
ADD heartbeat.yml ./heartbeat-7.4.2-linux-x86_64/heartbeat.yml

RUN wget http://www.313.co.kr/nexus/content/groups/public/313devgrp/filebeat/7.4.2-linux/filebeat-7.4.2-linux-x86_64.tar.gz
RUN tar zxvf filebeat-7.4.2-linux-x86_64.tar.gz
ADD filebeat.yml ./filebeat-7.4.2-linux-x86_64/filebeat.yml

RUN wget http://www.313.co.kr/nexus/content/groups/public/313devgrp/apm-agent-attach/1.17.0/apm-agent-attach-1.17.0-standalone.jar

ADD docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]