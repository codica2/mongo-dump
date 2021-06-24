#!/usr/bin/env sh

set +e

if [[ -z "${BACKUP_CRON_SCHEDULE}" ]]; then
  /usr/local/bin/backup
else
  BACKUP_CRON_SCHEDULE=${BACKUP_CRON_SCHEDULE}
  echo "${BACKUP_CRON_SCHEDULE} cd /usr/local/bin/ && /bin/bash ./backup > /cron.log" > /etc/crontabs/root
  echo "Starting cron ${BACKUP_CRON_SCHEDULE}"
  crond -f -d 0
fi
