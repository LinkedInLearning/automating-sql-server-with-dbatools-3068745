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
Get-DbaDbBackupHistory -SqlInstance $dbatools1