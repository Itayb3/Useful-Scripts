$date = (Get-Date).AddDays(-30)
﻿$newstring = (Get-WmiObject -Class win32_computerSystem | select username).username
$CurrentUser = $newstring.Remove(0,9)
$users = Get-ADUser -Filter {pwdLastSet -gt $date} -Properties pwdLastSet
$users | Select-Object -Property Name | Export-Csv -Path "C:\Users\${CurrentUser}\Desktop\ScriptResults.csv" -NoTypeInformation
Write-Host "Number of password resets this month:" $users.count