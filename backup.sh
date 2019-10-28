OPTIONS=`python /usr/local/bin/mongouri`
BACKUP_NAME="$(date -u +%Y-%m-%d_%H-%M-%S)_UTC.dump"

# Run backup
mongodump ${OPTIONS} --archive > /backup/"${BACKUP_NAME}"

# Upload backup
aws s3 cp "/backup/${BACKUP_NAME}" "s3://${S3_BUCKET}/${S3_PATH}/${BACKUP_NAME}"
# Delete temp files
rm -rf /backup/*