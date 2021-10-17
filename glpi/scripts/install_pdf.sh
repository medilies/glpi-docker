#!/bin/bash
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

shopt -s expand_aliases
source /root/.bashrc

# download and install pdf (Print to PDF) plugin

curl -L https://forge.glpi-project.org/attachments/download/2335/glpi-pdf-2.0.0.tar.gz \
    -o pdf.tar.gz &&
    tar -xzf pdf.tar.gz &&
    mv pdf plugins/ &&
    rm pdf.tar.gz &&
    glpicli plugin:install pdf -u glpi &&
    glpicli plugin:activate pdf &&
    chown -R www-data /var/www/html
