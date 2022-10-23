foreach($line in Get-Content "C:\Users\d.bouricand\Documents\sales.txt")

{
Write-Host "$line"
 Add-ADGroupMember -Identity "$line" -Members "FR-UG-Finance Manager"
  

} 

