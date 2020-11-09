FROM tomcat:8.5.38-jre8-slim

RUN apt-get update
RUN apt-get -y -q install libpcap0.8 wget

RUN wget http://www.313.co.kr/nexus/content/repositories/StandardProject/313devgrp/packetbeat/7.4.2-linux/packetbeat-7.4.2-linux-x86_64.tar.gz
RUN tar zxvf packetbeat-7.4.2-linux-x86_64.tar.gz
ADD packetbeat-7.4.2-linux.yml ./packetbeat-7.4.2-linux-x86_64/packetbeat.yml

ADD docker-entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["start"]
