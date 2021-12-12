#!/bin/bash

# Grants access to GLPI's database user access to timezones table

MYSQL_DATABASE=$(cat /run/secrets/MYSQL_DATABASE)
MYSQL_USER=$(cat /run/secrets/MYSQL_USER)
MYSQL_ROOT_PASSWORD=$(cat /run/secrets/MYSQL_ROOT_PASSWORD)

Q1="USE $MYSQL_DATABASE;"
Q2="GRANT SELECT ON mysql.time_zone_name TO '$MYSQL_USER'@'%';"
Q3="FLUSH PRIVILEGES;"

mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "$Q1 $Q2 $Q3"
