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
