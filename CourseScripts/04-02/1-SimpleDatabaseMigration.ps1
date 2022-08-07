<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
04-02 - Simple database migrations
-------------------------------------
#>

# view the databases
Get-DbaDatabase -SqlInstance $SQLInstances -ExcludeSystem | Select-Object SqlInstance, Name, Status, SizeMB

# copy all databases from dbatools1 --> dbatools2
$copySplat = @{
    Source = 'dbatools1'
    Destination = 'dbatools2'
    BackupRestore = $true
    SharedPath = '/shared'
    AllDatabases = $true
}
Copy-DbaDatabase @copySplat

# view the databases
Get-DbaDatabase -SqlInstance $SQLInstances -ExcludeSystem | Select-Object SqlInstance, Name, Status, SizeMB

# Remove the databases from dbatools2
Get-DbaDatabase -SqlInstance dbatools2 -ExcludeSystem | Remove-DbaDatabase -Confirm:$false

# copy all databases from dbatools1 --> dbatools2 & set source offline
Copy-DbaDatabase @copySplat -SetSourceOffline

# view the databases
Get-DbaDatabase -SqlInstance $SQLInstances -ExcludeSystem | Select-Object SqlInstance, Name, Status, SizeMB

# Remove the databases from dbatools2 ready for the next video
Get-DbaDatabase -SqlInstance dbatools2 -ExcludeSystem | Remove-DbaDatabase -Confirm:$false
