#!/bin/bash
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

#

MYSQL_DATABASE=$(cat /run/secrets/MYSQL_DATABASE)
# MYSQL_USER=$(cat /run/secrets/MYSQL_USER)
MYSQL_PASSWORD=$(cat /run/secrets/MYSQL_ROOT_PASSWORD)

TIMESTAMP=$(date +"%FT%H-%M-%S%z")
BACKUP_FILE_NAME=glpi_db_backup_"$TIMESTAMP"

mysqldump --user=root --password="$MYSQL_PASSWORD" "$MYSQL_DATABASE" >/backups/"$BACKUP_FILE_NAME".sql
