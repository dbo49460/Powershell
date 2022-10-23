Get-ChildItem -Recurse -Path 'R:\Téléchargements\Didier\Standard00à09_SLD - Copy' -Filter *.SLDPRT -and *.SLDASM -and *.SLDDRW | select FullName | Out-File C:\Intel\x.txt
Get-ChildItem -recurse -Path 'R:\PLANS\Plans_SLD\Standard00à09_SLD' | where {$_.Extension -in ".SLDPRT",".SLDASM",".SLDDRW"} | select FullName | Out-File C:\Intel\y.txt
###     | where {$FSO1.name -eq $_.name}

##[string]$Data =
$file1 = "C:\Intel\x.txt"
$file2 = "C:\intel\y.txt"
 Compare-Object -ReferenceObject (get-content $file1) -DifferenceObject (get-content $file2) | Out-File  c:\intel\testcompare.txt




