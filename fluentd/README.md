### Fluentd Daemonset Repo
https://github.com/fluent/fluentd-kubernetes-daemonset

<br/>

### Add Concat Plugin Dockerfile
* base: 1.16.1-debian-kafka2-1.2
* config: fluentd-with_concat_plugin.conf
* docker run
```
docker run --name fluentd -p 9880:9880 \
  -v $(pwd)/fluentd-with_concat_plugin.conf:/fluentd/etc/fluentd.conf \
  -e FLUENTD_CONF=fluentd.conf \
  fluentd-kubernetes-daemonset:v1.16.1-debian-kafka2-1.2
```


### Test
```
$ curl -X POST "http://{host}:9880/sample.test" -H "content-type: application/json" -d @test3-1.json
$ curl -X POST "http://{host}:9880/sample.test" -H "content-type: application/json" -d @test3-2.json
```


### Output ES
* index 조회
```
curl http://{es 주소}:9200/_cat/indices\?v
```
