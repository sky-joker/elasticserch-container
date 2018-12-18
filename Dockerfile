From centos:centos7
RUN localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG="ja_JP.UTF-8" \
    LANGUAGE="ja_JP:ja" \
    LC_ALL="ja_JP.UTF-8"
RUN ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
ADD etc/yum.repos.d/elk-stack.repo /etc/yum.repos.d/elk-stack.repo
ADD etc/yum.repos.d/elasticsearch-curator.repo /etc/yum.repos.d/elasticsearch-curator.repo
RUN yum -y install java-1.8.0-openjdk cronie
RUN yum -y install elasticsearch curator
ADD etc/elasticsearch/elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
RUN chmod 660 /etc/elasticsearch/elasticsearch.yml && \
    chown root.elasticsearch /etc/elasticsearch/elasticsearch.yml
ADD startup.sh /opt/startup.sh
RUN chmod 750 /opt/startup.sh
CMD ["/opt/startup.sh"]
