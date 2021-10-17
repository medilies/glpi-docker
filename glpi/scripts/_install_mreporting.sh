#!/bin/bash
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

shopt -s expand_aliases
source /root/.bashrc

# download and install more reporting plugin

# !!! The blugin is avilable in marketplace

MREPORTING_VERSION=1.7.3

curl -L https://github.com/pluginsGLPI/mreporting/releases/download/$MREPORTING_VERSION/glpi-mreporting-$MREPORTING_VERSION.tar.bz2 \
    -o mreporting.tar.bz2 &&
    bunzip2 mreporting.tar.bz2 &&
    tar -xf mreporting.tar -C /var/www/html/plugins &&
    rm mreporting.tar &&
    glpicli plugin:install mreporting -u glpi &&
    glpicli plugin:activate mreporting &&
    chown -R www-data /var/www/html
