FROM idock.daumkakao.io/elsie.s-test/fluentd-kubernetes-daemonset:v1.16.1-debian-kafka2-1.2

# install concat plugin
RUN gem install fluent-plugin-concat

# Environment variables
ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="fluent.conf"

# Overwrite ENTRYPOINT to run fluentd as root for /var/log / /var/lib
ENTRYPOINT ["tini", "--", "/fluentd/entrypoint.sh"]
