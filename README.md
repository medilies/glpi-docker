# GLPI on Docker

<img src="https://glpi-project.org/wp-content/uploads/2017/03/logo-glpi-bleu-1.png" alt="GLPI Logo" width="75"/>
<img src="https://www.docker.com/sites/default/files/d8/styles/role_icon/public/2019-07/vertical-logo-monochromatic.png?itok=erja9lKc" alt="Docker Logo" width="75"/>
<img src="https://www.mysql.com/common/logos/logo-mysql-170x115.png" alt="MySQL Logo" width="75"/>
<img src="https://www.phpmyadmin.net/static/images/logo.png?067b638aa2a2" alt="PHPMyAdmin Logo" width="75"/>
<img src="http://www.apache.org/logos/res/httpd/default.png" alt="Apache Logo" width="75"/>
<img src="https://i0.wp.com/phpmagazine.net/wp-content/uploads/2020/09/php8.png?w=420&ssl=1" alt="PHP8 Logo" width="75"/>

---

## Get started

Note that we focus on GLPI 9.5.5 and its compatible plugins

1. Datainjection 2.9.0
2. Mreporting 1.7.3
3. Addressing 2.9.0
4. Fusioninventory 3.0
5. Ocsinventoryng 1.7.3
6. Print pdf 2.0.0
7. Shellcommands 3.0.0

### Requirements

Must have docker & docker-compose on your system!

Download the latest release from this repo.

### Default installation

Launch the stack (Assuming that `docker-compose.yml` is within the directory `glpi`)

```shell
cd glpi
docker-compose up
```

Install GLPI and our selected plugins

```shell
docker container exec -it glpi_web_1 /scripts/full_setup.sh
docker container exec -it glpi_db_1 /scripts/setup.sh
```

The previous commands mainly install GLPI and its plugins, Set contabs to backup DB & web files daily.

Now grap your favorite browser and enjoy managing your infrastructure with GLPI ;D

## Backup & Restoring

### Manual Backups

-   DB backup

    ```shell
    docker container exec -it glpi_db_1 /scripts/db_backup.sh
    ```

-   Web files backup

    ```shell
    docker container exec -it glpi_web_1 /scripts/web_files_backup.sh
    ```

Backups are dumped into their respective containers `/backups` folder.

NOTE: backup folder are mapped to the host system:

-   DB: `glpi/stack_dumps/db_backups:/backups`
-   WEB: `glpi/stack_dumps/web_files_backups:/backups`

### Manual backups restorations

-   DB restoration

    ```shell
    docker container exec -it glpi_db_1 /scripts/db_restore.sh
    ```

-   Web files restoration

    ```shell
    docker container exec -it glpi_web_1 /scripts/web_files_restore.sh
    ```

Both commands will ask you for the backup absolute path (`/backups/<timestamp>_glpi_db_backup.sql`,
`/backups/<timestamp>_glpi_web_backup.tar.gz`).

### Crontab backups

If you have followed the default installation, backup scripts are set to run every 8 hours (`0 */8 * * *`). That is set within `DB:/scripts/cron_db_backup.sh` `WEB:/scripts/cron_web_files_backer.sh`

## Stack customization

Before starting the containers :

-   It is vital for the security of your deployment to edit the sercrets values within `./secrets`
-   Open `./docker-compose.yml` and edit the the lines where you see the comment `# CHANGE` to suit your environment

## TODO:

-   Add interactivity to the shell scripts to select plugins to install and which versions
-   Integrate OCS

## LICENCE

The project is under the MIT licence so feel free to fork it and contribute to it :)
