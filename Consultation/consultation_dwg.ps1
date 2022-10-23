# dbo 27/01/2022

$path00 = 'R:\PLANS\Plans_DWG\Standard00@09_DWG'
$path10 = 'R:\PLANS\Plans_DWG\Standard10@49_DWG'
$path50 = 'R:\PLANS\Plans_DWG\Standard50@99_DWG'
$path100 = 'R:\PLANS\Plans_DWG\Standard51@100_DWG'

#On lit les articles, si < 10 on recherche directement dans le bon répertoire

foreach($line in Get-Content "C:\Users\d.bouricand\Documents\TEST11.txt")
{

if ($line.Substring(0,2) -lt '10') {

$car2 = $line.Substring(0,2)



$tres = (Get-ChildItem -Path $path00 -Filter $car2* | Where-Object {$_.PSIsContainer} | Select-Object -ExpandProperty Fullname)

$chemin = $tres

                                    }


#On lit les articles, si > 09 et < 50 on recherche directement dans le bon répertoire


elseif (($line.Substring(0,2) -gt '09') -and ($line.Substring(0,2) -lt '50'))
 {
 $car2 = $line.Substring(0,2)


$tres = (Get-ChildItem -Path $path10 -Filter $car2* | Where-Object {$_.PSIsContainer} | Select-Object -ExpandProperty Fullname)

$chemin = $tres

 }



elseif (($line.Substring(0,2) -gt '49') -and ($line.Substring(0,2) -lt '100'))

{
$car2 = $line.Substring(0,2)


$tres = (Get-ChildItem -Path $path50 -Filter $car2* | Where-Object {$_.PSIsContainer} | Select-Object -ExpandProperty Fullname)

$chemin = $tres

}


else 

{



$tres = (Get-ChildItem -Path $path100 -Filter $car2* | Where-Object {$_.PSIsContainer} | Select-Object -ExpandProperty Fullname)


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

$CheminComplet | Out-File -FilePath c:\didier\DWG_en_erreur.txt -Append
if ($CheminCompletLaser -eq $null) {
 $CheminCompletLaser | Out-File -FilePath c:\didier\DWG_en_erreur.txt -Append
                                    }

}

}
