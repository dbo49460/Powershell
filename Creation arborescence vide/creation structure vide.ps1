
get-childitem "C:\sagepaie" -recurse -directory  | % {
     Write-Host $_.FullName

     $a=$_.FullName
    

write-host $a.substring(3) # pour supprimer le c:\ du full path
$b = $a.substring(3) 


foreach($line in $b)

{ 
    try
    {
    New-Item -Path "c:\toto" -Name $line -ItemType "directory"
   
    }
    catch
    {
            Write-Warning "erreur pour $line"
    }

            Write-Host "pas d'erreur alors on continue la suite du script pour $line "
			}
			}


get-childitem "C:\toto" -recurse -directory  | Sort-Object -Descending {
     Write-Host $_.FullName }
   #-NewName { $_.name -replace 'PHOTOS', 'Photos'}
       $a=$_.FullName
			
foreach($line in $a)

{ 
    try
    {
    Rename-Item -path $a -NewName { $line -replace '$a', "$a.ttt"}
   
    }
    catch
    {
            Write-Warning "erreur pour $line"
    }

            Write-Host "pas d'erreur alors on continue la suite du script pour $line "
			}


}
