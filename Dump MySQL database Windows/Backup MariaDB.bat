f:

cd F:\MariaDB\bin\
mysqldump --user=backup_user --password=tGuQZr332aKU8kp --default-character-set=UTF8 --lock-tables --databases sirius > F:\Backup_Sirius\SIRIUS.95.sql
cd F:\Backup_Sirius
ren SIRIUS.95.sql SIRIUS_%time:~0,2%%time:~3,2%-%DATE:/=%.sql