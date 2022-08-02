<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
03-01 - Set databases online\offline
-------------------------------------
#>

# View current database status
$datatbaseSplat = @{
    SqlInstance   = 'dbatools1'
    ExcludeSystem = $true
}
Get-DbaDatabase @datatbaseSplat | Select-Object SqlInstance, Name, Status

# Set a database offline
Set-DbaDbState -SqlInstance dbatools1 -Database Northwind, Pubs -Offline

# View current database status
$datatbaseSplat = @{
    SqlInstance   = 'dbatools1'
    ExcludeSystem = $true
}
Get-DbaDatabase @datatbaseSplat | Select-Object SqlInstance, Name, Status

# Set a database online
Set-DbaDbState -SqlInstance dbatools1 -Database Northwind -Online

# View current database status
$datatbaseSplat = @{
    SqlInstance   = 'dbatools1'
    ExcludeSystem = $true
}
Get-DbaDatabase @datatbaseSplat | Select-Object SqlInstance, Name, Status

# Use piping to set offline databases back online
Get-DbaDbState -SqlInstance dbatools1 | Where-Object Status -eq 'Offline' | Set-DbaDbState -Online

# View current database status
$datatbaseSplat = @{
    SqlInstance   = 'dbatools1'
    ExcludeSystem = $true
}
Get-DbaDatabase @datatbaseSplat | Select-Object SqlInstance, Name, Status