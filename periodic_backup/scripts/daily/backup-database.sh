#!/bin/sh
# 20260620 v1

BACKUP_FOLDER=/backup
NOW=$(date '+%Y%m%d')

GZIP=$(which gzip)
#MYSQLDUMP=$(which mysqldump)
MARIADBDUMP=$(which mariadb-dump)

### MySQL Server Login info ###
MDB=$MYSQL_DATABASE
MHOST=$MYSQL_CONTAINER_NAME
MPASS=$MYSQL_ROOT_PASSWORD
MUSER=root
MBACKUP_DAYS=$MYSQL_KEEP_BACKUP_DAYS

[ ! -d "$BACKUP_FOLDER" ] && mkdir --parents $BACKUP_FOLDER

FILE=${BACKUP_FOLDER}/ozg.sql.gz
ARCHIVEFILE=${BACKUP_FOLDER}/${NOW}_ozg.sql.gz

$MARIADBDUMP -h $MHOST -u $MUSER -p${MPASS} --databases $MDB | $GZIP -9 > $FILE

cp ${FILE} ${ARCHIVEFILE}

find /backup/* -type f -mtime $MBACKUP_DAYS -name '*.gz' -delete
