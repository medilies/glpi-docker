#!/bin/bash

shopt -s expand_aliases
source /root/.bashrc

# download and install datainjection plugin

# !!! The blugin is avilable in marketplace

DATAINJECTION_VERSION=2.9.0

curl -L https://github.com/pluginsGLPI/datainjection/releases/download/$DATAINJECTION_VERSION/glpi-datainjection-$DATAINJECTION_VERSION.tar.bz2 \
    -o datainjection.tar.bz2 &&
    bunzip2 datainjection.tar.bz2 &&
    tar -xf datainjection.tar -C /var/www/html/plugins &&
    rm datainjection.tar &&
    glpicli plugin:install datainjection -u glpi &&
    glpicli plugin:activate datainjection &&
    chown -R www-data /var/www/html
