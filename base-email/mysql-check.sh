#!/bin/bash -eux

source /etc/environment

for ((i=0;i<10;i++))
do
    DB_CONNECTABLE=$(mysql -uvimbadmin -p$DB_ENV_MYSQL_PASSWORD -hdb -P3306 -e 'status' >/dev/null 2>&1; echo "$?")
    if [[ DB_CONNECTABLE -eq 0 ]]; then
        exit 0
    fi
    sleep 5
done

exit 1

