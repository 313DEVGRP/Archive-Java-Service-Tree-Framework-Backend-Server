#!/bin/sh

#packetbeat start
/usr/local/tomcat/packetbeat-7.4.2-linux-x86_64/packetbeat -e -c /usr/local/tomcat/packetbeat-7.4.2-linux-x86_64/packetbeat.yml &

#tomcat start
/usr/local/tomcat/bin/catalina.sh run
