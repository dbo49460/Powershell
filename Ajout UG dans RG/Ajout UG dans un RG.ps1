foreach($line in Get-Content "C:\Users\d.bouricand\Documents\groupeREADONLY3.txt")

{
Write-Host "$line"
 Add-ADGroupMember -Identity "$line" -Members FR-UG-CEO
  

} 

#LE GROUPE FR-UG-CEO doit exister
#utilisation donner le fichier texte avec les groupes RG de l'active directory
# ici le boss voulait etre dans TOUS les groupes de ressource en lecture seule.