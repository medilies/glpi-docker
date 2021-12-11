#!/bin/bash
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

# Script to create a cronjob for web directory backup
echo "0 */4 * * * root /scripts/db_backer.sh" >/etc/cron.d/db_backer &&
    chown root /etc/cron.d/db_backer &&
    chgrp root /etc/cron.d/db_backer &&
    chmod 0700 /etc/cron.d/db_backer &&
    # crontab -u root /etc/cron.d/db_backer &&
    /etc/init.d/cron restart
