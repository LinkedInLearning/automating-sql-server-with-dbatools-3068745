<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
02-01 - Get database status across your estate
-------------------------------------
#>

# Find a command that matches the pattern of *database*status*
Find-DbaCommand -Pattern *database*status*

# Review the help for that command
Get-Help Get-DbaDbState -Full

# Run Get-DbaDbState
Get-DbaDbState -SqlInstance $dbatools1

# Run Get-DbaDbState with selected columns
Get-DbaDbState -SqlInstance $dbatools1 | Select-Object SqlInstance, DatabaseName, Status, RW, Access | Format-Table 

# Find a command that matches the pattern of *database*status*
Find-DbaCommand -Pattern *database*status*

## Get databases
$datatbaseSplat = @{
    SqlInstance   = $SQLInstances
}
Get-DbaDatabase @datatbaseSplat

## Get databases
$datatbaseSplat = @{
    SqlInstance   = $SQLInstances
}
Get-DbaDatabase @datatbaseSplat | Select-Object -First 1 *

## Get databases - selected properties, and format as a table
$datatbaseSplat = @{
    SqlInstance   = $SQLInstances
}
Get-DbaDatabase @datatbaseSplat | Select-Object SqlInstance, Name, Status, RecoveryModel, Owner, Compatibility | 
Format-Table