$file1 = "C:\Intel\x.txt"
$file2 = "C:\intel\y.txt"

compare-object (get-content $File1) (get-content $File2) | Out-File C:\Intel\res99.txt