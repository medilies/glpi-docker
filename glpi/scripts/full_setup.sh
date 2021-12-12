#!/bin/bash
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

/scripts/install_glpi.sh

/scripts/cron_web_files_backer.sh

# plugins installation
/scripts/install_fusioninventory.sh
/scripts/install_datainjection.sh
/scripts/_install_mreporting.sh
/scripts/install_pdf.sh
/scripts/install_addressing.sh
/scripts/install_shellcommands.sh
/scripts/install_ocs.sh
