## copie sans rien modifier
param ([string]$indice,[string]$title, [string]$chaine)

$fichiers = Get-ChildItem -Path "C:\Intel" -Filter "$title" -Recurse 
Write-Host $fichiers
write-host $fichiers.directoryname

ForEach ($file In $fichiers)
{
    Write-Host 'Replacing:'$file.FullName
    $aaa = $file.DirectoryName
    Write-Host "le chemin est $aaa"
   # write-host $file
   # $char_de_fin = $file.Substring($file.Length-1)
    
    
       # Copy-Item -Path "$chaine" -Destination $file.FullName -Force
   
      

#$indice = "Z"
#$title = "AZa.445cc3"
# on decompose en 2 sous chaines
#before_str avant le point
#after_str apres le point
$extension_name = $title.split('.')[-1]
$cleanTitle = $title.split('.')[-1].Length
$total = $title.Length
$before = $title.Substring(0,$title.Length-1)
$before_str = $title.split('.')[0]

$after_str = $title.split('.')[1]
$nb_before = $before_str.Length

$char_de_fin1 = $before_str.Substring($before_str.Length-1)
$new_file_after_minus = $before_str.Substring(0,$before_str.Length-1)
$new_file_after = -join ("$new_file_after_minus","$indice")
#NFACSN  Nouveau fichier apres correction sans nombre ex: AZERTYA.CSV  passage en indice B --> AZERTYB.CSV
$NFACSN = -join ("$new_file_after",".","$after_str")
    
    if($char_de_fin1 -match "^\d+$")
{
   #Write-Host "okyyyyyyyyyy c'est un nombre $title"
   #######$file = $nouvelle_chaine
   $nouvelle_chaine = -join ("$before_str","$indice",".","$after_str")
   $file = $nouvelle_chaine
   copy-Item -Path "$chaine" -Destination $aaa\$nouvelle_chaine
   write-host "le nouveau non de fichier est $nouvelle_chaine et copie effectuee"
   #Write-Host "fichier destiantion est $file.fullname"

   Remove-Item $aaa\$title
}

   else {

  write-host "deja un indice \n"
   
   Write-Host "Le nom du nouveau fichier est $NFACSN"
   $file = $NFACSN
  # $nouvelle_chaine = -join ("$before_str","$indice",".","$after_str")
   copy-Item -Path "$chaine" -Destination $aaa\$file
  write-host "-------  copie depuis $chaine vers  $aaa\$file ----------"
   write-host "le nouveau non de fichier est $NFACSN et copie effectuee dans $aaa\$NFACSN "
   Remove-Item $aaa\$title
   Write-Host "fichier destiantion est $file.fullname"
    }

#Write-Host "$cleanTitle pour extension de $title et total est de $total"
#Write-Host "before est de $before"
#Write-Host "after $after"
#Write-Host "l'extension est $extension_name compose de $cleanTitle caracteres"
#write-host "avant $before_str et apres le point c'est $after_str"
#Write-Host "nb devant $nb_before"


}