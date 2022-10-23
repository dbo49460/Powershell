foreach($line in Get-Content "C:\Users\d.bouricand\Documents\RG-RW_only.txt")

{
Write-Host "$line"
 Add-ADGroupMember -Identity "$line" -Members "FR-UG-CEO"
  

} 

