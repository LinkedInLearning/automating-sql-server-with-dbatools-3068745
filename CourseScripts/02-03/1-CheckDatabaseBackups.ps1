<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
02-02 - RunningCheck database last backup times
-------------------------------------
#>

# Find commands that match the pattern backup
Find-DbaCommand backup

# View example uses
Get-Help Get-DbaDbBackupHistory -Examples

# Get backup history for the dbatools1 instance
Get-DbaDbBackupHistory -SqlInstance dbatools1

# Get last backup times for all our Sql Instances
Get-DbaDatabase -SqlInstance $SQLInstances | 
Select-Object SqlInstance, Name, RecoveryModel, LastFullBackup, LastDiffBackup, LastLogBackup | 
Format-Table

# Get databases that haven't had a full backup in 7 days
Get-DbaDatabase -SqlInstance $SQLInstances | 
Where-Object LastFullBackup -lt (get-date).AddDays(-7) | 
Select-Object SqlInstance, Name, RecoveryModel, LastFullBackup, LastDiffBackup, LastLogBackup | 
Format-Table

# Pipe those databases to Backup-DbaDatabase and take a full backup
Get-DbaDatabase -SqlInstance $SQLInstances | 
Where-Object LastFullBackup -lt (get-date).AddDays(-7) | 
Backup-DbaDatabase
