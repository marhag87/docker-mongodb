# MongoDB (MMS) server
#
# VERSION 0.1.0

FROM fedora:21
MAINTAINER Martin Hagstrom <martin@mrhg.se>

# MMS component versions
ENV monitoringversion=3.1.0.175-1
ENV automationversion=1.7.0.992-1

# Update
RUN yum update -y
# Install deps
RUN yum install -y make wget unzip vim curl git mongodb

# Fetch MMS components
RUN wget https://mms.mongodb.com/download/agent/automation/mongodb-mms-automation-agent-manager-${automationversion}.x86_64.rpm
RUN wget https://mms.mongodb.com/download/agent/monitoring/mongodb-mms-monitoring-agent-${monitoringversion}.x86_64.rhel7.rpm

# Install MMS components
RUN yum install -y mongodb-mms-automation-agent-manager-${automationversion}.x86_64.rpm mongodb-mms-monitoring-agent-${monitoringversion}.x86_64.rhel7.rpm

# Create /data path for mongo data
RUN mkdir /data && chown mongod:mongod /data

# Add config file
ADD mms-settings.conf /root/mms-settings.conf

# Add script that updates real config files
ADD update-mms-settings.sh /root/update-mms-settings.sh

# Mongo runs on 27000
EXPOSE 27000/tcp

CMD /root/update-mms-settings.sh
