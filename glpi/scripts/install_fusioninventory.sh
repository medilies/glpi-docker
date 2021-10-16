#!/bin/bash

shopt -s expand_aliases
source /root/.bashrc

# download and install fusion inventory plugin

GLPI_VERSION=9.5
FUSIONINVENTORY_VERSION=3.0

curl -L https://github.com/fusioninventory/fusioninventory-for-glpi/releases/download/glpi$GLPI_VERSION%2B$FUSIONINVENTORY_VERSION/fusioninventory-$GLPI_VERSION+$FUSIONINVENTORY_VERSION.tar.bz2 \
    -o fusioninventory.tar.bz2 &&
    bunzip2 fusioninventory.tar.bz2 &&
    tar -xf fusioninventory.tar -C /var/www/html/plugins &&
    rm fusioninventory.tar &&
    glpicli plugin:install fusioninventory -u glpi &&
    glpicli plugin:activate fusioninventory &&
    chown -R www-data /var/www/html &&
    #
    touch /var/spool/cron/crontabs/www-data &&
    crontab -u www-data /var/spool/cron/crontabs/www-data &&
    echo "*/1 * * * * /usr/bin/php5 /var/www/html/glpi/front/cron.php &>/dev/null" \
        >>/var/spool/cron/crontabs/www-data &&
    /etc/init.d/cron restart
