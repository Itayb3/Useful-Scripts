Import-Module ActiveDirectory
$ChosenOu = " " # add the chosen OU
$computers = Get-ADComputer -Filter * -SearchBase $ChosenOu -Properties Enabled, LastLogonTimestamp
$computers | ForEach-Object {
    $_.LastLogonDate = [datetime]::FromFileTime($_.LastLogonTimestamp)
}
Write-Host "Total computers found:" $computers.Count
$ChosenPath = " " # where you want to save the output to
$computers | Select-Object Name, Enabled, LastLogonDate | Export-Csv -Path $ChosenPath -NoTypeInformation

Write-Host "Exported list to $ChosenPath"
