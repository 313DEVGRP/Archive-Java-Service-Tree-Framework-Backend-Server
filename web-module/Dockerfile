FROM tomcat:8.5.73-jre8
MAINTAINER 313DEVGRP <313@313.co.kr>

RUN rm -rf /usr/local/tomcat/webapps/ROOT
ARG JAR_FILE
ADD target/${JAR_FILE} /usr/local/tomcat/webapps/ROOT.war

RUN wget http://www.313.co.kr/nexus/content/repositories/StandardProject/313devgrp/packetbeat/7.4.2-linux/packetbeat-7.4.2-linux-x86_64.tar.gz
RUN tar zxvf packetbeat-7.4.2-linux-x86_64.tar.gz
ADD src/main/resources/script/yml/elfk/client/packetbeat.yml ./packetbeat-7.4.2-linux-x86_64/packetbeat.yml

RUN wget http://www.313.co.kr/nexus/content/repositories/StandardProject/313devgrp/topbeat/1.3.1/topbeat-1.3.1-x86_64.tar.gz
RUN tar zxvf topbeat-1.3.1-x86_64.tar.gz
ADD src/main/resources/script/yml/elfk/client/topbeat.yml ./topbeat-1.3.1-x86_64/topbeat.yml

RUN wget http://www.313.co.kr/nexus/content/repositories/StandardProject/313devgrp/metricbeat/7.4.2-linux/metricbeat-7.4.2-linux-x86_64.tar.gz
RUN tar zxvf metricbeat-7.4.2-linux-x86_64.tar.gz
ADD src/main/resources/script/yml/elfk/client/metricbeat.yml ./metricbeat-7.4.2-linux-x86_64/metricbeat.yml

RUN wget http://www.313.co.kr/nexus/content/repositories/StandardProject/313devgrp/heartbeat/7.4.2-linux/heartbeat-7.4.2-linux-x86_64.tar.gz
RUN tar zxvf heartbeat-7.4.2-linux-x86_64.tar.gz
ADD src/main/resources/script/yml/elfk/client/heartbeat.yml ./heartbeat-7.4.2-linux-x86_64/heartbeat.yml

RUN wget http://www.313.co.kr/nexus/content/repositories/StandardProject/313devgrp/filebeat/7.4.2-linux/filebeat-7.4.2-linux-x86_64.tar.gz
RUN tar zxvf filebeat-7.4.2-linux-x86_64.tar.gz
ADD src/main/resources/script/yml/elfk/client/filebeat.yml ./filebeat-7.4.2-linux-x86_64/filebeat.yml

RUN wget http://www.313.co.kr/nexus/content/repositories/StandardProject/313devgrp/elastic-apm-agent/1.18.1/elastic-apm-agent-1.18.1.jar
RUN mv elastic-apm-agent-1.18.1.jar /usr/local/tomcat/lib/elastic-apm-agent.jar

ENV JAVA_OPTS="-Xmx2g -Xms2g -Dspring.profiles.active=live -javaagent:/usr/local/tomcat/lib/elastic-apm-agent.jar -Delastic.apm.service_name=www313cokr -Delastic.apm.application_packages=egovframework -Delastic.apm.server_urls=http://192.168.25.46:8200"

ADD docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["sh","/entrypoint.sh"]
CMD ["start"]