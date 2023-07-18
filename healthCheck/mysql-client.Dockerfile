FROM ubuntu:22.04

RUN apt-get update \
    && apt-get install -y mysql-client

RUN echo Verifying install ... \
    && mysql --version

#CMD mysql -u [계정] -h [host] -P [port] --password=[pass]
CMD while true; do sleep 3600; done
