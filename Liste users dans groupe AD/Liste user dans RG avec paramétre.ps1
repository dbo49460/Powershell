Param(
[string]$groupead
)

Get-ADGroup -Filter "Name -like '$groupead*'" | select name | ForEach {



    $groupName = $_.Name

    write-host "Personnes dans le groupe" --> $groupName
    Write-Host "----------------------------------------------------------------"
    
Get-ADGroupMember -identity $groupName -Recursive | Get-ADUser -Property DisplayName | Select Name

Write-Host "***************************************************************"

}