FROM tomcat:8.5.38-jre8-slim
MAINTAINER 313DEVGRP <313@313.co.kr>

RUN rm -rf /usr/local/tomcat/webapps/ROOT
ARG JAR_FILE
ADD target/${JAR_FILE} /usr/local/tomcat/webapps/ROOT.war

RUN apt-get update
RUN apt-get -y -q install libpcap0.8 wget procps

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

RUN wget http://www.313.co.kr/nexus/content/groups/public/313devgrp/scouter/2.8.1/scouter-2.8.1.jar
RUN mv scouter-2.8.1.jar /usr/local/tomcat/lib/scouter.agent.jar
ADD scouter-2.8.1.conf /usr/local/tomcat/conf/scouter.conf

RUN wget http://www.313.co.kr/nexus/content/groups/public/313devgrp/elastic-apm-agent/1.18.1/elastic-apm-agent-1.18.1.jar
RUN mv elastic-apm-agent-1.18.1.jar /usr/local/tomcat/lib/elastic-apm-agent.jar

ENV JAVA_OPTS="-Xmx2g -Xms2g -javaagent:/usr/local/tomcat/lib/scouter.agent.jar -Dscouter.config=/usr/local/tomcat/conf/scouter.conf -Dobj_name=www313cokr -javaagent:/usr/local/tomcat/lib/elastic-apm-agent.jar -Delastic.apm.service_name=my-cool-service -Delastic.apm.application_packages=egovframework.api,egovframework.com -Delastic.apm.server_urls=http://192.168.25.46:8200"

ADD docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]