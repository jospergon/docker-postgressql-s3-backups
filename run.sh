#!/bin/bash

touch /.env.sh

echo "export DB_PORT_5432_TCP_ADDR=${DB_PORT_5432_TCP_ADDR}" >> /.env.sh
echo "export DB_ENV_POSTGRES_USER=${DB_ENV_POSTGRES_USER}" >> /.env.sh
echo "export PGPASSWORD=${PGPASSWORD}" >> /.env.sh
echo "export BUCKET=${BUCKET}" >> /.env.sh
echo "export APPNAME=${APPNAME}" >> /.env.sh

echo "access_key=${AWS_ACCESS_KEY}" >> ${HOME}/.s3cfg
echo "secret_key=${AWS_SECRET_KEY}" >> ${HOME}/.s3cfg

crontab /etc/crontab
cron

tail -F /var/log/cron.log
