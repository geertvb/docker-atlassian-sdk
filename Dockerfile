#
# Atlassian SDK Dockerfile
#
# https://github.com/GeertVB/docker-atlassian-sdk
#

FROM 192.168.0.29:5000/geertvb/docker-maven

RUN \
  apt-get update && \
  apt-get -y upgrade

RUN \
  echo "deb https://sdkrepo.atlassian.com/debian/ stable contrib" >>/etc/apt/sources.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys B07804338C015B73 && \
  sudo apt-get install apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install atlassian-plugin-sdk
  
CMD /bin/bash
