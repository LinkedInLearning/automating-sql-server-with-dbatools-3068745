<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
04-03 - More advanced database migrations
-------------------------------------
#>

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
    Database = 'Northwind'
    NoRecovery = $true
}
Copy-DbaDatabase @copySplat

# view the databases
Get-DbaDatabase -SqlInstance $SQLInstances -ExcludeSystem | Select-Object SqlInstance, Name, Status, SizeMB

# View the categories
Invoke-DbaQuery -SqlInstance dbatools1 -Database Northwind -Query 'select CategoryName, Description from categories'

# Add a new category
Invoke-DbaQuery -SqlInstance dbatools1 -Database Northwind -Query "insert into Categories (CategoryName, Description) Values ('Vegetables','Fresh vegetables')"

# Transaction log backup
Backup-DbaDatabase -SqlInstance dbatools1 -Database Northwind -Type Log -Path /shared/northwind_migrate.trn

# Restore that transaction log backup
Restore-DbaDatabase

# copy all databases from dbatools1 --> dbatools2 & set source offline
Copy-DbaDatabase @copySplat -SetSourceOffline

# view the databases
Get-DbaDatabase -SqlInstance $SQLInstances -ExcludeSystem | Select-Object SqlInstance, Name, Status, SizeMB

# Remove the databases from dbatools2 ready for the next video
Get-DbaDatabase -SqlInstance dbatools2 -ExcludeSystem | Remove-DbaDatabase -Confirm:$false
