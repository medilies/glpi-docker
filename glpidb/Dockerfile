FROM mysql:8.0.26

LABEL MAINTAINER medilies
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

RUN apt-get update || apt-get update

RUN apt-get install -y cron  && \
    apt-get clean

COPY ./scripts /scripts
RUN chmod +x /scripts/*
