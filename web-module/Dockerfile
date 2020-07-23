FROM tomcat:8.5.38-jre8-slim
MAINTAINER 313DEVGRP <313@313.co.kr>

RUN rm -rf /usr/local/tomcat/webapps/ROOT
ARG JAR_FILE
ADD target/${JAR_FILE} /usr/local/tomcat/webapps/ROOT.war

ARG SCOUTER_FILE
ADD target/${SCOUTER_FILE} /usr/local/tomcat/lib/scouter.agent.jar

ARG SCOUTER_CONF
ADD target/${SCOUTER_CONF} /usr/local/tomcat/conf/scouter.conf

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]