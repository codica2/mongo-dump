#!/bin/bash
OPTIONS=`python3 /usr/local/bin/mongouri`
BACKUP_NAME="$(date -u +%Y-%m-%d_%H-%M-%S).dump"

if [[ ! -z ${MONGO_PASS} ]]; then
  MONGO_P="--password ${MONGO_PASS}"
else
  MONGO_P=""
fi

if [[ ! -z ${MONGO_USER} ]]; then
  MONGO_U="-u ${MONGO_USER}"
else
  MONGO_U=""
fi

if [[ ! -z ${MONGO_DB_NAME} ]]; then
  MONGO_D="-d ${MONGO_DB_NAME}"
else
  MONGO_D=""
fi
sleep 3
# Run backup
mongodump ${OPTIONS} ${MONGO_U} ${MONGO_P}  --archive > /backup/"${BACKUP_NAME}"
sleep 10
# Upload backup
aws s3 cp "/backup/${BACKUP_NAME}" "s3://${S3_BUCKET}/${S3_PATH}/${BACKUP_NAME}"
# Delete tmp files
#rm -rf /backup/*

