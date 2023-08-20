Import-Module ActiveDirectory
$ChosenOu = " " #chose the OU to run the script on
$ChosenPath = " " #chose the path for the export output
$Chosen_In_days = (Get-Date).AddDays(-90) #u can change the parameter to whatever you want, i chose 90 days as "inactive"
$InactiveUsers = Get-ADUser -Filter {LastLogonDate -lt $Chosen_In_days -or LastLogonDate -eq $null} -SearchBase $ouDistinguishedName -Properties LastLogonDate | Export-Csv -Path $ChosenPath -NoTypeInformation
Write-Host "Users to be disabled:" $InactiveUsers.Count
$InactiveUsers | ForEach-Object {
    Disable-ADAccount -Identity $_.DistinguishedName
    Write-Host ("Disabled user: " + $_.Name)
}

Write-Host "Operation completed"
