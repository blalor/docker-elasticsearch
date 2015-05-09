FROM blalor/java
MAINTAINER Brian Lalor <blalor@bravo5.org>

EXPOSE 9200 9300

ADD src/ /tmp/src/
RUN /tmp/src/config.sh

## the volume mapped to this location needs to be writable by the elasticsearch
## user/group which appears to have ids 498/499. Ownership set on launch by
## launch.sh
VOLUME [ "/var/lib/elasticsearch" ]

ENV ES_CLUSTER_NAME logstash
ENV ES_INDEX_NUMBER_OF_SHARDS 1
ENV ES_INDEX_NUMBER_OF_REPLICAS 0
ENV ES_DISK_THRESHOLD_ENABLED false
