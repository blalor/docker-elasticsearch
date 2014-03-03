FROM blalor/java
MAINTAINER Brian Lalor <blalor@bravo5.org>

EXPOSE 9200 9300

RUN yum -y localinstall --nogpgcheck \
    https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.noarch.rpm

ADD src/ /tmp/src/
RUN /tmp/src/config.sh

## the volume mapped to this location needs to be writable by the elasticsearch
## user/group which appears to have ids 498/499. Ownership set on launch by
## launch.sh
VOLUME [ "/var/lib/elasticsearch" ]
