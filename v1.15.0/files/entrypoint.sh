#!/bin/sh
set -eu

# shellcheck disable=2039
jobs_httpcheck="
- name: https://${HOSTNAME}
  url: https://${HOSTNAME}
  not_follow_redirects: no
  tls_skip_verify: yes
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

# shellcheck disable=2039
jobs_x509="
  - name: https://${HOSTNAME}
    source: https://${HOSTNAME}
"

# First check if job exists, if not add it
! grep -q "$jobs_httpcheck" /etc/netdata/go.d/httpcheck.conf && echo "$jobs_httpcheck" >> /etc/netdata/go.d/httpcheck.conf
! grep -q "$jobs_mysql" /etc/netdata/go.d/mysql.conf && echo "$jobs_mysql" >> /etc/netdata/go.d/mysql.conf
! grep -q "$jobs_x509" /etc/netdata/go.d/x509check.conf && echo "$jobs_x509" >> /etc/netdata/go.d/x509check.conf
! grep -q "$jobs_redis" /etc/netdata/python.d/redis.conf && echo "$jobs_redis" >> /etc/netdata/python.d/redis.conf

# Start Default Netdata Entrypoint
exec /usr/sbin/run.sh