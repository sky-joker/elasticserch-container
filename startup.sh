#!/usr/bin/bash
/usr/sbin/crond -n &
su - elasticsearch -s /usr/bin/bash -c '/usr/share/elasticsearch/bin/elasticsearch -p /var/run/elasticsearch/elasticsearch.pid --quiet'
