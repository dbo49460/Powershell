foreach($line in Get-Content "C:\users\d.bouricand\desktop\groupqse.txt")

{
 
   $info = $line -split ";"


    $group = $info[0]

    $oupath = $info[1]

    $grouptype = $info[2]


    new-ADGroup -Name $group -Path $oupath -GroupScope $grouptype




} 

