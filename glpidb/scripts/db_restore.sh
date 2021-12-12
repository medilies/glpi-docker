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

echo "Enter the backup file path:"
read -r DATABASE_BACKUP

mysql -uroot -p"$MYSQL_ROOT_PASSWORD" "$MYSQL_DATABASE" <"$DATABASE_BACKUP"
