#!/bin/bash

config_file=/root/mms-settings.conf

[[ -f $config_file ]] || { echo "Can't find config file"; exit 1; }
source $config_file

sed -i -e "s/^mmsApiKey.*$/mmsApiKey=${mmsApiKey}/" -e "s/^mmsGroupId.*$/mmsGroupId=${mmsGroupId}/" /etc/mongodb-mms/automation-agent.config
sed -i -e "s/^mmsApiKey.*$/mmsApiKey=${mmsApiKey}/" /etc/mongodb-mms/monitoring-agent.config

service mongodb-mms-automation-agent start
service mongodb-mms-monitoring-agent start

exec /bin/bash
