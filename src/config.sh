#!/bin/bash

set -e
set -x

cd /tmp/src

yum -y localinstall --nogpgcheck \
    https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-1.4.5.noarch.rpm

tar -c -C skel -f - . | tar -xf - -C /

## cloud-aws plugin required for s3 snapshots
/usr/share/elasticsearch/bin/plugin -install elasticsearch/elasticsearch-cloud-aws/2.4.1

## install some other plugins, just because
## not versioned; let's go for some kind of consistency, eh?
## https://github.com/mobz/elasticsearch-head
/usr/share/elasticsearch/bin/plugin -install mobz/elasticsearch-head/3706e79d501bbca457c7a36fa3350131cb76b29e

## https://github.com/royrusso/elasticsearch-HQ
/usr/share/elasticsearch/bin/plugin -install royrusso/elasticsearch-HQ/603ae9ed1b63ad6ffd0f81fb8ebf9f4f820ea360

## https://github.com/lmenezes/elasticsearch-kopf/
/usr/share/elasticsearch/bin/plugin -install lmenezes/elasticsearch-kopf/1.4.2

## cleanup
cd /
yum clean all
rm -rf /var/tmp/yum-root* /tmp/src
