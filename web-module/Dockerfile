FROM tomcat/8.5.38-jre8-alpine
MAINTAINER 313DEVGRP <313@313.co.kr>

RUN rm -rf /usr/local/tomcat/webapps/ROOT
ARG JAR_FILE
ADD target/${JAR_FILE} /usr/local/tomcat/webapps/ROOT.war