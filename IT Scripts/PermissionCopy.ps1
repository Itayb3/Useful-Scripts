Import-Module ActiveDirectory
$sourceUser = Read-Host "Enter the username to copy permissions from"
$destinationUser = Read-Host "Enter the username to add permissions to"
$sourceGroups = Get-ADUser -Identity $sourceUser -Properties memberOf | Select-Object -ExpandProperty memberOf
foreach ($group in $sourceGroups) {
#note to self
#I included a try-catch block in the script to handle such errors gracefully. 
#This way, if the destination user is already a member of a group, the script won't halt execution—it'll 
#simply print an error message for that group and continue with the rest of the groups.
    try {
        Add-ADGroupMember -Identity $group -Members $destinationUser
        Write-Host "Added $destinationUser to $group." -ForegroundColor Green
    } catch {
        Write-Host "Error adding $destinationUser to $group. Details: $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "Execution finished :)"
