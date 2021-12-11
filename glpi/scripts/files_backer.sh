#!/bin/bash
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

# touch /var/spool/cron/crontabs/www-data \
#     && \
#     crontab -u www-data /var/spool/cron/crontabs/www-data \
#     && \
#     echo "*/1 * * * * /usr/bin/php5 /var/www/html/glpi/front/cron.php &>/dev/null" \
#     >> /var/spool/cron/crontabs/www-data \
#     && \
#     /etc/init.d/cron restart

# Script to create a web directory backup

TIMESTAMP=$(date -u +"%FT%H-%M-%S")
TIMESTAMP=$(date +"%FT%H-%M-%S%z")
BACKUP_FILE_NAME=glpi_web_backup_"$TIMESTAMP"

tar ckzf /backups/"$BACKUP_FILE_NAME".tar.gz /var/www/html
