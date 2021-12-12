#!/bin/bash
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

#

MYSQL_DATABASE=$(cat /run/secrets/MYSQL_DATABASE)
# MYSQL_USER=$(cat /run/secrets/MYSQL_USER)
MYSQL_ROOT_PASSWORD=$(cat /run/secrets/MYSQL_ROOT_PASSWORD)

TIMESTAMP=$(date +"%FT%H-%M-%S%z")
BACKUP_FILE_NAME="$TIMESTAMP"_glpi_db_backup

mysqldump --user=root --password="$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" >/backups/"$BACKUP_FILE_NAME".sql
