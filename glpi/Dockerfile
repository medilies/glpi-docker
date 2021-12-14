FROM php:8.0-apache-buster

LABEL MAINTAINER medilies
#
# Writter : Boudouma Mohamed Ilies (medilies)
# Github repo: https://github.com/medilies/glpi
# My Linkedin: https://www.linkedin.com/in/medilies/
# -----------------------------------------------------------------------------

RUN apt-get update || apt-get update

# PHP extentions
RUN \
    pecl install apcu && \
    docker-php-ext-enable apcu \
    && \
    apt-get install -y libbz2-dev && \
    docker-php-ext-install bz2 \
    && \
    curl -L https://github.com/apereo/phpCAS/releases/download/1.4.0/CAS-1.4.0.tgz \
    --output /var/CAS-1.4.0.tgz && \
    pear install /var/CAS-1.4.0.tgz && \
    rm /var/CAS-1.4.0.tgz \
    && \
    docker-php-ext-install exif \
    && \
    apt-get install -y libpng-dev libjpeg-dev libwebp-dev && \
    docker-php-ext-configure gd --with-jpeg --with-webp &&\
    docker-php-ext-install gd \
    && \
    apt-get install -y libc-client-dev libkrb5-dev && \
    docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && \
    apt-get install -y libicu-dev && \
    docker-php-ext-install intl \
    && \
    apt-get install -y libldap2-dev && \
    docker-php-ext-install ldap \
    && \
    docker-php-ext-install mysqli \
    && \
    docker-php-ext-install opcache \
    && \
    docker-php-ext-install pdo && \
    docker-php-ext-install pdo_mysql \
    && \
    apt-get install -y libxml2-dev && \
    pecl install xmlrpc-1.0.0RC2 && \
    docker-php-ext-enable xmlrpc \
    && \
    apt-get install -y libzip-dev && \
    docker-php-ext-install zip \
    && \
    apt-get clean

COPY ./glpi.ini /usr/local/etc/php/conf.d/glpi.ini

RUN apt-get install -y cron unzip && \
    apt-get clean

RUN echo 'alias glpicli="/var/www/html/bin/console"' >>/root/.bashrc 

COPY ./scripts /scripts
RUN chmod +x /scripts/*

RUN chown -R www-data .

EXPOSE 80 443