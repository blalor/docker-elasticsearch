#!/bin/bash

set -e
set -x

cd /tmp/src

mv elasticsearch-logging.yml /etc/elasticsearch/logging.yml
mv elasticsearch.yml         /etc/elasticsearch/elasticsearch.yml

mv elasticsearch-logrotate.conf /etc/logrotate.d/elasticsearch

mv supervisord.conf /etc/supervisor.d/elasticsearch.conf

mv launch.sh /usr/local/bin/launch-elasticsearch.sh

## cleanup
cd /

yum clean all
rm -rf /var/tmp/yum-root* /tmp/src
