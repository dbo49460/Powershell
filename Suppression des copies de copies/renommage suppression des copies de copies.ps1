$Path = 'C:\Users\d.bouricand\Desktop\RESTORE\'



Get-ChildItem -path $Path -Recurse -force -include *.pst| Where-Object {$_.name -Match " - Copie"} |


Foreach-Object{  
   $dd = $_.FullName
   $repertoire = $_.DirectoryName
    $long = $_.Name.Length
   # le substring prend en compte les extensions de fichiers  
   $go = $_.name.substring(0,$long-12) 
  $bb = $_.Name
   $aa = "$dd"
  # Write-Host $long et le $go et aussi $bb
  if($bb -match " - Copie") {
if (Test-Path $aa) {
  Remove-Item "$repertoire\$go.pst"
  write-host $bb et go $Path\$go et aa $aa puis $dd et basename $de

}}
}