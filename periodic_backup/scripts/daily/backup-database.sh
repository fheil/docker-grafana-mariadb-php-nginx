#!/bin/sh

BACKUP_FOLDER=/backup
NOW=$(date '+%Y%m%d')

GZIP=$(which gzip)
MYSQLDUMP=$(which mysqldump)

### MySQL Server Login info ###
MDB=$MYSQL_DATABASE
MHOST=$MYSQL_CONTAINER_NAME
MPASS=$MYSQL_ROOT_PASSWORD
MUSER=root
MBACKUP_DAYS=$MYSQL_KEEP_BACKUP_DAYS

[ ! -d "$BACKUP_FOLDER" ] && mkdir --parents $BACKUP_FOLDER

FILE=${BACKUP_FOLDER}/${NOW}_backup.sql.gz
$MYSQLDUMP -h $MHOST -u $MUSER -p${MPASS} --databases $MDB | $GZIP -9 > $FILE

find /backup/* -type f -mtime $MBACKUP_DAYS -name '*.gz' -delete
