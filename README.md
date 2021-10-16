TODO:

-   Automate "GRANT SELECT ON mysql.time_zone_name TO 'glpi_user'@'%'; FLUSH PRIVILEGES;"
-   Automate Database backups
-   Automate GLPI web folden backups

Get up & running:

-   `cd` to the cloned repo folder then run `docker-compose up --build`
-   `bash` in <stack_name>\_glpi_1 (`docker container exec -it [glpi] bash`) and run `/scripts/install.bash`

Note:

-   You must have docker on your system ( ik kinda obv :p )
-   The installation may take so long on a hard disk so be patient with your HDD
