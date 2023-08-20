$newstring = (Get-WmiObject -Class win32_computerSystem | select username).username
$CurrentUser = $newstring.Remove(0,9)
$sourcePath = "C:\Users\${CurrentUser}\"
$DestinationPath = " the shared folder" #REPLACE THIS WITH THE FOLDER PATH
if (! (Test-Path -Path $DestinationPath))
{
New-Item -ItemType Directory -Path $DestinationPath
}
Copy-Item -Path $sourcePath -Destination $DestinationPath -Recurse -Force
Write-Output "Backup created successfully!"