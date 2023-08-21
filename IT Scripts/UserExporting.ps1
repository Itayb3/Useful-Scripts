Import-Module ActiveDirectory
$ChosenOu = "fill the chosen OU here"
$users = Get-ADUser -Filter * -SearchBase $ouDistinguishedName -Properties Enabled
Write-Host "Total users found:" $users.Count
$ChosenPath #where you want to save the output
$users | Select-Object Name, Enabled | Export-Csv -Path $ChosenPath -NoTypeInformation
Write-Host "Exported list to ChosenPath"