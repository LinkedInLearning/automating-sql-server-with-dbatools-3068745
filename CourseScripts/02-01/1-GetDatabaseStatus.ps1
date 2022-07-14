<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
02-01 - Get database status across your estate
-------------------------------------
#>

# Find a command that matches the pattern *database*status*
Find-DbaCommand -Pattern *database*status*

# Review the help for that command
Get-Help Get-DbaDbState -Full

# Run Get-DbaDbState
Get-DbaDbState -SqlInstance $dbatools1 | Select

## Get databases
$datatbaseSplat = @{
    SqlInstance   = $dbatools1
    ExcludeSystem = $true
    OutVariable   = "dbs"        # OutVariable to also capture this to use later
}
Get-DbaDatabase @datatbaseSplat |
Select-Object Name, Status, RecoveryModel, Owner, Compatibility |
Format-Table

