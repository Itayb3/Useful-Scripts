Import-Module ActiveDirectory
$forest = Get-ADForest
if ($forest.ForestMode -ge "Windows2008R2Forest") {
    if ($forest.RecycleBinEnabled -eq $false) {
        Write-Host "Enabling the Active Directory Recycle Bin..."
        Enable-ADOptionalFeature 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target $forest.Name -Confirm:$false
        Write-Host "Active Directory Recycle Bin has been enabled successfully!" -ForegroundColor Green
    } else {
        Write-Host "The Active Directory Recycle Bin is already enabled." -ForegroundColor Yellow
    }
} else {
    Write-Host "The forest must be at least Windows Server 2008 R2 to enable the Recycle Bin. Current forest functional level: $($forest.ForestMode)" -ForegroundColor Red
    Write-Host "And honestly if you are using an older version than 2008 you have other problems do solve first :)"
}