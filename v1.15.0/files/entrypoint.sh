#!/bin/sh
set -eu



jobs_httpcheck="
- name: https://${HOSTNAME}/users/login
  url: https://${HOSTNAME}/users/login
"

jobs_mysql="
- name: MISP-DB
  dsn: $MYSQL_USER:$MYSQL_PASSWORD@tcp($MYSQL_HOST:$MYSQL_PORT)/$MYSQL_DATABASE?charset=utf8
"

jobs_redis="
misp-redis:
    name     : misp-redis
    host     : ${REDIS_FQDN}
    port     : ${REDIS_PORT}
"

echo "$jobs_httpcheck" >> /etc/netdata/go.d/httpcheck.conf
echo "$jobs_mysql" >> /etc/netdata/go.d/mysql.conf
echo "$jobs_redis" >> /etc/netdata/python.d/redis.conf


# Start Default Netdata Entrypoint
exec /usr/sbin/run.sh