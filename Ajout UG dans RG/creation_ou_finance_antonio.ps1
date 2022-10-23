foreach($line in Get-Content "C:\users\d.bouricand\desktop\printer_group.txt")

{
 
   $info = $line -split ";"
   

    $group = $info[0]

    $oupath = $info[1]

    $grouptype = $info[2]
   # Write-Host "$group et $oupath encore $grouptype"

    new-ADGroup -Name "$group" -Path "$oupath" -GroupScope $grouptype




} 

