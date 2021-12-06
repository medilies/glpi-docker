#!/bin/bash
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

# Script to create a cronjob for web directory backup
echo "*/1 * * * * root /scripts/files_backer.sh" >/etc/cron.d/files_backer &&
    chown root /etc/cron.d/files_backer &&
    chgrp root /etc/cron.d/files_backer &&
    chmod 0700 /etc/cron.d/files_backer &&
    # crontab -u root /etc/cron.d/files_backer &&
    /etc/init.d/cron restart

# NOTE
# Debian cron specific, Set a cron job
# Just by putting a file with a cron job specification in /cron.d
#   And making the file readable by root
#   Then retarting cron
