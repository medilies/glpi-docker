#!/bin/bash
mysql -uroot -p -e "GRANT SELECT ON mysql.time_zone_name TO 'glpi_user'@'%'; FLUSH PRIVILEGES;"