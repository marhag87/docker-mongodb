# MongoDB (MMS) server
#
# VERSION 0.2.0

FROM fedora:21
MAINTAINER Martin Hagstrom <martin@mrhg.se>

# MMS component versions
ENV monitoringversion=3.1.0.175-1
ENV automationversion=1.7.0.992-1

ADD mongodb.repo /etc/yum.repos.d/mongodb.repo

# Update
RUN yum update -y
# Install deps
RUN yum install -y make wget unzip vim curl git mesa-libGL mongodb-org mongodb-org-server

## Fetch MMS components
#RUN wget https://mms.mongodb.com/download/agent/automation/mongodb-mms-automation-agent-manager-${automationversion}.x86_64.rpm
#RUN wget https://mms.mongodb.com/download/agent/monitoring/mongodb-mms-monitoring-agent-${monitoringversion}.x86_64.rhel7.rpm
#
## Install MMS components
#RUN yum install -y mongodb-mms-automation-agent-manager-${automationversion}.x86_64.rpm mongodb-mms-monitoring-agent-${monitoringversion}.x86_64.rhel7.rpm

# Create /data path for mongo data
RUN mkdir /data && chown mongod:mongod /data

# Install mongoProc
RUN mkdir /mongoproc
RUN wget https://s3.amazonaws.com/edu-downloads.10gen.com/1.0/mongoProc_linux_x86_64.tar.gz
RUN tar xf mongoProc_linux_x86_64.tar.gz -C /mongoproc/

## Add config file
#ADD mms-settings.conf /root/mms-settings.conf
#
## Add script that updates real config files
#ADD update-mms-settings.sh /root/update-mms-settings.sh

# Mongo runs on 27000
EXPOSE 27000/tcp

#CMD /root/update-mms-settings.sh
CMD bash
