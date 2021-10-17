#!/bin/bash
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

shopt -s expand_aliases
source /root/.bashrc

# Script to download & install GLPI

DB_SERVER=$(cat /run/secrets/DB_SERVER)
MYSQL_DATABASE=$(cat /run/secrets/MYSQL_DATABASE)
MYSQL_USER=$(cat /run/secrets/MYSQL_USER)
MYSQL_PASSWORD=$(cat /run/secrets/MYSQL_PASSWORD)

GLPI_VERSION=9.5
GLPI_VERSION_CORRECTIVE=5

# if [ "$GLPI_VERSION" ]; then
#     echo ""
# else
#     echo "Provide the GLPI version you wish to install: "
#     read -r GLPI_VERSION
# fi
# echo "$GLPI_VERSION"

curl -L https://github.com/glpi-project/glpi/releases/download/$GLPI_VERSION.$GLPI_VERSION_CORRECTIVE/glpi-$GLPI_VERSION.$GLPI_VERSION_CORRECTIVE.tgz \
    -o glpi.tgz &&
    tar -xzf glpi.tgz &&
    rm glpi.tgz &&
    mv glpi/* /var/www/html &&
    glpicli db:install -H "$DB_SERVER" --db-name="$MYSQL_DATABASE" -u "$MYSQL_USER" -p "$MYSQL_PASSWORD" --force &&
    chown -R www-data /var/www/html &&
    rm /var/www/html/install/install.php
