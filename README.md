<img src="https://raw.githubusercontent.com/glpi-project/glpi/master/pics/logos/logo-GLPI-250-black.png" alt="GLPI Logo" width="200"/>
<img src="https://www.docker.com/sites/default/files/d8/styles/role_icon/public/2019-07/vertical-logo-monochromatic.png?itok=erja9lKc" alt="Docker Logo" width="200"/>
<img src="https://www.mysql.com/common/logos/logo-mysql-170x115.png" alt="MySQL Logo" width="200"/>
<img src="https://www.phpmyadmin.net/static/images/logo.png?067b638aa2a2" alt="PHPMyAdmin Logo" width="200"/>
<img src="http://www.apache.org/logos/res/httpd/default.png" alt="Apache Logo" width="200"/>
<img src="https://i0.wp.com/phpmagazine.net/wp-content/uploads/2020/09/php8.png?w=420&ssl=1" alt="PHP8 Logo" width="200"/>

---

The shell scripts will automatically download and install:

-   GLPI 9.5.5
-   Datainjection 2.9.0
-   Mreporting 1.7.3
-   Addressing 2.9.0
-   Fusioninventory 3.0
-   Ocsinventoryng 1.7.3
-   Print pdf 2.0.0
-   Shellcommands 3.0.0

# Setup

Note:

-   You must have docker on your system ( ik kinda obv :p )
-   The installation may take so long on a hard disk so be patient with your HDD

## Fast get up & running

`cd` to the cloned repo folder then run `docker-compose up --build`

`bash` into **<stack_name>\_glpi_1** (`docker container exec -it [glpi] bash`) and run `/scripts/install.bash`

## Customization

It is vital for the security of your deployment to edit the sercrets values within `./secrets`

Open `./docker-compose.yml` and edit the the lines where you see the comment `# CHANGE` to suit your environment

#TODO:

-   Automate "GRANT SELECT ON mysql.time_zone_name TO 'glpi_user'@'%'; FLUSH PRIVILEGES;"
-   Automate Database backups
-   Automate GLPI web folden backups
-   Add interactivity to the shell scripts to select plugins to install and which versions

The project is under the MIT licence so feel free to fork it and contribute to it :)
