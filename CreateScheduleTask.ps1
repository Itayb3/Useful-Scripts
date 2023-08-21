Import-Module ActiveDirectory
$OU = ""  # Update with the chosen OU DN
$scriptToRun = ""  #Add the location of the script. i suggest saving the script in the sysvol folder so every computer can access it 
$taskName = "ScheduledTask"  
$taskTime = ""  # The time when the task should run

$computers = Get-ADComputer -SearchBase $OU -Filter *

foreach ($computer in $computers) {
    $computerName = $computer.Name
    #note to self  /tn - task name /tr - task to run /sc - start time /f - force
    # also note to whoever going to use this, change the parameters to fit your needs, this is just a basic example
    Write-Output "Processing $computerName"
    $command = "schtasks /create /s $computerName /tn $taskName /tr $scriptToRun /sc DAILY /st $taskTime /f"

    Invoke-Expression $command
}

Write-Output "Done processing all computers in $OU."
