<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
04-01 - Migrate whole instances with one line of code
-------------------------------------
#>

# Check the help docs
Get-Help Start-DbaMigration

# Migrate everything from dbatools1 to dbatools2
$migrateSplat = @{
    Source = 'dbatools1'
    Destination = 'dbatools2'
    BackupRestore = $true
    SharedPath = '/shared'
}
Start-DbaMigration @migrateSplat