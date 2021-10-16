#!/bin/bash

# touch /var/spool/cron/crontabs/www-data \
#     && \
#     crontab -u www-data /var/spool/cron/crontabs/www-data \
#     && \
#     echo "*/1 * * * * /usr/bin/php5 /var/www/html/glpi/front/cron.php &>/dev/null" \
#     >> /var/spool/cron/crontabs/www-data \
#     && \
#     /etc/init.d/cron restart

# Script to create a web directory backup

TIMESTAMP=$(date +"%FT%H-%M-%S")
BACKUP_FILE_NAME=glpi_web_backup_"$TIMESTAMP"

tar ckzf /scripts/"$BACKUP_FILE_NAME".tar.gz /var/www/html