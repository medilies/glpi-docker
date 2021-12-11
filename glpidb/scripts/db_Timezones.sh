#!/bin/bash

MYSQL_DATABASE=$(cat /run/secrets/MYSQL_DATABASE)
MYSQL_USER=$(cat /run/secrets/MYSQL_USER)
MYSQL_PASSWORD=$(cat /run/secrets/MYSQL_ROOT_PASSWORD)

mysql -uroot -p"$MYSQL_PASSWORD" -e "USE $MYSQL_DATABASE; GRANT SELECT ON mysql.time_zone_name TO '$MYSQL_USER'@'%'; FLUSH PRIVILEGES;"
