#!/bin/bash
set -e

MYSQL_ROOT_USER=root
mysql -u ${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} <<-EOF
create user ${DB_USER}@'%' identified by '${DB_PASSWORD}';
grant all on ${DB_NAME}.* to ${DB_USER}@'%' with grant option;
EOF