#!/bin/bash

DATE=$(date +%Y%m%d)

docker exec mariadb mysqldump \
-u root \
-proot123456 wordpressdb \
> backup_$DATE.sql
