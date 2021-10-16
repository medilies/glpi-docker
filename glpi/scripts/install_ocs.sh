#!/bin/bash

shopt -s expand_aliases
source /root/.bashrc

# download and install ocs inventory plugin

OCS_VERSION=1.7.3

curl -L https://github.com/pluginsGLPI/ocsinventoryng/releases/download/$OCS_VERSION/glpi-ocsinventoryng-$OCS_VERSION.tar.gz \
    -o ocsinventoryng.tar.gz &&
    tar -xzf ocsinventoryng.tar.gz &&
    mv ocsinventoryng plugins/ &&
    rm ocsinventoryng.tar.gz &&
    glpicli plugin:install ocsinventoryng -u glpi &&
    glpicli plugin:activate ocsinventoryng &&
    chown -R www-data /var/www/html
