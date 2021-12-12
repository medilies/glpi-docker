#!/bin/bash
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

# Script to create a cronjob for glpi database backup

echo "0 */8 * * * root /scripts/db_backup.sh" >/etc/cron.d/db_backup &&
    chown root /etc/cron.d/db_backup &&
    chgrp root /etc/cron.d/db_backup &&
    chmod 0700 /etc/cron.d/db_backup &&
    # crontab -u root /etc/cron.d/db_backup &&
    /etc/init.d/cron restart
