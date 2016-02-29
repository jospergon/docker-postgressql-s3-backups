#!/bin/bash

source /.env.sh

BACKUP_DATE=`date +%d-%B-%Y`

BACKUP_FILE="${DB_ENV_POSTGRES_USER}_${BACKUP_DATE}.dump"

pg_dump -h ${DB_PORT_5432_TCP_ADDR} -U ${DB_ENV_POSTGRES_USER} ${DB_ENV_POSTGRES_USER} -Fc > ${BACKUP_FILE}

s3cmd -c ${HOME}/.s3cfg put ${BACKUP_FILE} s3://${BUCKET}/${APPNAME}/
