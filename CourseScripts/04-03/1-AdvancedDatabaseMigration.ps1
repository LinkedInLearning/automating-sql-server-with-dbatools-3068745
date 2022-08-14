<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
04-03 - More advanced database migrations
-------------------------------------
#>

# view the databases
Get-DbaDatabase -SqlInstance $SQLInstances -ExcludeSystem | Select-Object SqlInstance, Name, Status, SizeMB

# copy Northwind database from dbatools1 --> dbatools2 but with NORECOVERY
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

# Final copy that uses the last log backup and sets the source offline
$copyPartTwoSplat = @{
    Source = 'dbatools1'
    Destination = 'dbatools2'
    BackupRestore = $true
    Database = 'Northwind'
    SetSourceOffline = $true
    UseLastBackup = $true
    Continue = $true
}
Copy-DbaDatabase @copyPartTwoSplat

# View the categories
Invoke-DbaQuery -SqlInstance dbatools2 -Database Northwind -Query 'select CategoryName, Description from categories'

# view the databases
Get-DbaDatabase -SqlInstance $SQLInstances -ExcludeSystem | Select-Object SqlInstance, Name, Status, SizeMB

# Bring the database back online on dbatools1 ready for the next video
Set-DbaDbState -SqlInstance dbatools1 -Database Northwind -Online