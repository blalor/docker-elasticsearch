FROM localhost:5000/core/java
MAINTAINER Brian Lalor <brian@autosportlabs.com>

EXPOSE 9200 9300

RUN yum -y localinstall --nogpgcheck \
    https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-0.90.9.noarch.rpm

ADD src/ /tmp/src/
RUN /tmp/src/config.sh

## the volume mapped to this location needs to be writable by the elasticsearch
## user/group which appears to have ids 498/499. Ownership set on launch by
## launch.sh
VOLUME [ "/var/lib/elasticsearch" ]
