#!/bin/bash
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

#

echo "Enter the backup archive path:"
read -r WEB_FILES_BACKUP

tar -xzf "$WEB_FILES_BACKUP" -C /var/www

# Just in case ... :p
/scripts/cron_web_files_backup.sh
