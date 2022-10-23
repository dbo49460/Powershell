Get-ADGroup -Filter "Name -like 'AzureGrp - License - ExchangeOnline - P1'"  | ForEach {



    $groupName = $_.Name

    write-host "Groupe AD " --> $groupName
     
 Get-ADGroupMember -identity $groupName -Recursive | Get-ADUser -Property DisplayName  | Out-File -FilePath C:\Users\d.bouricand\ONLINELIC.txt


}