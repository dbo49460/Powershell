Get-ChildItem F:\Fichiers_Durtal\BE\PLANS\Plans_SLD\COMMERCE -Recurse -File | 
    Group-Object Length | 
    Where-Object { $_.Count -gt 1 } | 
    select -ExpandProperty group | 
    foreach {Get-FileHash -LiteralPath $_.FullName} | 
    group -Property hash | 
    where { $_.count -gt 1 } | 
    select -ExpandProperty group