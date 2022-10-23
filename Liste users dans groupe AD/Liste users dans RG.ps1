$OUPATH = "OU=France,DC=tesmecgroup,DC=local"

Get-ADGroup -Filter "Name -like 'AzureGrp - License - AzureADPremium - P1'" | select name | ForEach {



    $groupName = $_.Name

    write-host "Groupe AD " --> $groupName
     
 Get-ADGroupMember -identity $groupName -Recursive | Get-ADUser -Property DisplayName | Select Name | Sort-Object name | Out-File -FilePath C:\Users\d.bouricand\azureadpremium.txt


}