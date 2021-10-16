#!/bin/bash

shopt -s expand_aliases
source /root/.bashrc

# download and install shellcommands plugin

# !!! Require installed binaries to execute em

SHELLCOMMANDS_VERSION=3.0.0

curl -L https://github.com/InfotelGLPI/shellcommands/releases/download/$SHELLCOMMANDS_VERSION/glpi-shellcommands-$SHELLCOMMANDS_VERSION.tar.gz \
    -o shellcommands.tar.gz
tar -xzf shellcommands.tar.gz &&
    mv shellcommands plugins/ &&
    rm shellcommands.tar.gz &&
    glpicli plugin:install shellcommands -u glpi &&
    glpicli plugin:activate shellcommands &&
    chown -R www-data /var/www/html
