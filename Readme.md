# elasticserch-container

Elasticsearchが動作するコンテナを構築するためのファイルを保存しているリポジトリです。

## 使い方

### vm.max_map_count設定

標準だと `vm.max_map_count` のサイズが小さいため起動せず以下のエラーログが出力されます。

```
[1]: max virtual memory areas vm.max_map_count [65530] is too low, increase to at least [262144]
```

そのため、以下のように `vm.max_map_count` のサイズを上げます。  
[https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html](https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html)

```
# vi /etc/sysctl.conf
(snip)
vm.max_map_count = 262144
# sysctl -p /etc/sysctl.conf
```

### Dockerfileビルド

Dockerfileを使ってイメージを作成します。

```
# docket build . -t elastic:latest
```

### コンテナ起動

コンテナを起動します。


```
# docker run -it -d --name elastic elastic:latest
```

Elasticsearchが起動したことを確認します。

```
# curl http://172.17.0.2:9200
{
  "name" : "7MjZJIi",
  "cluster_name" : "elasticsearch",
  "cluster_uuid" : "qFqM0WAvTXKLK_hauKJ3sQ",
  "version" : {
    "number" : "6.5.3",
    "build_flavor" : "default",
    "build_type" : "rpm",
    "build_hash" : "159a78a",
    "build_date" : "2018-12-06T20:11:28.826501Z",
    "build_snapshot" : false,
    "lucene_version" : "7.5.0",
    "minimum_wire_compatibility_version" : "5.6.0",
    "minimum_index_compatibility_version" : "5.0.0"
  },
  "tagline" : "You Know, for Search"
}
```
