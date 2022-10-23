$rep = 'F:\Backup_Sirius'
Get-ChildItem $rep | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-2))} | Remove-Item
Get-ChildItem 'F:\Backup_GLPI' | Where-Object {($_.LastWriteTime -lt (Get-Date).AddDays(-2))} | Remove-Item