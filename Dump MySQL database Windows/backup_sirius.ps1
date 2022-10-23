
# DO NOT USE THIS SCRIPT 
$user='backup_user'
$pass='tGuQZr332aKU8kp'

$datebak=Get-Date -Format "MM-dd-yyyy_hh-mm-ss"
cd F:\MariaDB\bin\
./mysqldump --user=$user --password=$pass --default-character-set=latin1 --lock-tables --databases sirius > F:\Backup_Sirius\SIRIUS.$datebak.sql
$compress = @{
LiteralPath= "F:\Backup_Sirius\SIRIUS.$datebak.sql"
CompressionLevel = "Fastest"
DestinationPath = "F:\Backup_Sirius\SIRIUS.$datebak.sql.zip"
}
Compress-Archive @compress
Remove-Item F:\Backup_Sirius\SIRIUS.$datebak.sql

### --default-character-set=latin1
