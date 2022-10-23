# dbo 27/01/2022
# dbo 31/01/2022
$USERPROFILE = $Env:USERPROFILE
$path00 = 'R:\PLANS\Plans_DWG\Standard00@09_DWG'
$path10 = 'R:\PLANS\Plans_DWG\Standard10@49_DWG'
$path50 = 'R:\PLANS\Plans_DWG\Standard50@99_DWG'
#$path100 = 'R:\PLANS\Plans_DWG\Standard51@100_DWG'

#On lit les articles, si < 10 on recherche directement dans le bon rÃ©pertoire

foreach($line in Get-Content "$USERPROFILE\Documents\TEST12.txt")

{

if (($line.Substring(0,2) -lt '10')) {

$car2 = $line.Substring(0,2)



$tres = (Get-ChildItem -Path $path00 -Filter $car2* | Where-Object {$_.PSIsContainer} | Select-Object -ExpandProperty Fullname)

$chemin = $tres

 }


#On lit les articles, si > 09 et < 50 on recherche directement dans le bon rÃ©pertoire


elseif (($line.Substring(0,2) -gt '09') -and ($line.Substring(0,2) -lt '50'))
 {
 $car2 = $line.Substring(0,2)


$tres = (Get-ChildItem -Path $path10 -Filter $car2* | Where-Object {$_.PSIsContainer} | Select-Object -ExpandProperty Fullname)

$chemin = $tres

 }

 else 


{
$car2 = '0'
$car2 = $line.Substring(0,2)


$tres = (Get-ChildItem -Path $path50 -Filter $car2* | Where-Object {$_.PSIsContainer} | Select-Object -ExpandProperty Fullname)

$chemin = $tres

}


try {

$Fichier = $line+".dwg"
$FichierLaser = $line+ " LASER"+".dwg"

 $CheminComplet = Get-ChildItem -path $chemin -filter $Fichier -Recurse | %{$_.FullName}

 $CheminCompletLaser = Get-ChildItem -path $chemin -filter $FichierLaser -Recurse | %{$_.FullName}
 if ($CheminCompletLaser)
 {
 Write-Host LASER
 Copy-Item $CheminCompletLaser c:\didier\
 echo $CheminCompletLaser OK | Out-File -FilePath c:\didier\DWG_reussis.txt -Append
 }
 
 Write-Host $CheminComplet

Copy-Item $CheminComplet c:\didier\
echo $CheminComplet OK | Out-File -FilePath c:\didier\DWG_reussis.txt -Append
}


catch {
$bobo = $car2

$CheminComplet | Out-File -FilePath c:\didier\DWG_en_erreur.txt -Append
if ($CheminCompletLaser -eq $null) {
 $FichierLaser | Out-File -FilePath c:\didier\DWG_en_erreur.txt -Append
                                    }

}

}
