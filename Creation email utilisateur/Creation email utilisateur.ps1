﻿Get-ADUser -Filter * -SearchBase "OU=Users,OU=France,DC=tesmecgroup,DC=local" -Properties EmailAddress,DisplayName, samaccountname| select EmailAddress, DisplayName |Out-File Documents\emailusers.txt