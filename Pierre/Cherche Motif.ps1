#dbo 17/02/2022

$M1 = '^1'
$M2 = '^;2'
$M3 = '^;;3'
$M4 = '^;;;4'
$data = @()

$aze = Get-Content -Path "C:\Users\d.bouricand\Desktop\TEST PIERRE\CLASSEUR1.csv"
$longueur = $aze.Length
Write-Host $longueur

for($i = 0; $i -le $longueur; $i++){
    
   # $aze = Get-Content -Path "C:\Users\d.bouricand\Desktop\TEST PIERRE\CLASSEUR1.csv"
 #   write-host $i -------- $aze[$i]

    if ($aze[$i] -match $M1) {

 #   write-host $i ok $aze[$i]
    $data += $i
     }

    elseif (($aze[$i] -match $M2) -and ($aze[$i+1] -match $M3)) {
   
 #   write-host $i ok $aze[$i]
    $data += $i

    }



     elseif (($aze[$i] -match $M3) -and ($aze[$i+1] -match $M4)) {
#
 #   write-host $i ok $aze[$i]
    $data += $i

    }


    else {  }

  
}

$tableaulongueur = $data.Length
Write-Host longueur $tableaulongueur
for ($i=0 ;$i -lt $tableaulongueur;$i++) {

$refere = $data[$i]
#write-host $refere
write-host $aze[$refere]
#
}