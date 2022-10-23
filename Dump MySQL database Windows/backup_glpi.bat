
f:

cd F:\MariaDB\bin\
mysqldump --user=root --password=Intelinside2021 --default-character-set=UTF8 --lock-tables --databases glpidb > F:\Backup_GLPI\glpidb.sql
cd F:\Backup_GLPI
ren glpidb.sql glpidb%time:~0,2%%time:~3,2%-%DATE:/=%.sql
