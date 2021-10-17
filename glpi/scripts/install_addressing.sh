#!/bin/bash
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

shopt -s expand_aliases
source /root/.bashrc

# download and install ip addressing plugin

ADDRESSING_VERSION=2.9.0

curl -L https://github.com/pluginsGLPI/addressing/releases/download/$ADDRESSING_VERSION/glpi-addressing-$ADDRESSING_VERSION.tar.gz \
    -o addressing.tar.gz &&
    tar -xzf addressing.tar.gz &&
    mv addressing plugins/ &&
    rm addressing.tar.gz &&
    glpicli plugin:install addressing -u glpi &&
    glpicli plugin:activate addressing &&
    chown -R www-data /var/www/html
