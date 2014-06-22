FROM geertvb/maven

RUN \
  apt-get update && \
  sudo apt-get install apt-transport-https

RUN \
  echo "deb https://sdkrepo.atlassian.com/debian/ stable contrib" >>/etc/apt/sources.list && \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys B07804338C015B73 && \
  sudo apt-get update && \
  sudo apt-get install atlassian-plugin-sdk

RUN \
  groupadd atlassian && \
  useradd -d /home/atlassian -m -s /bin/bash atlassian -g atlassian

USER atlassian

WORKDIR /home/atlassian

RUN \
  mkdir -p /home/atlassian/.m2/repository && \
  mkdir -p /home/atlassian/amps-standalone/target

VOLUME /home/atlassian/.m2/repository

VOLUME /home/atlassian/amps-standalone/target
  
CMD /bin/bash -l
