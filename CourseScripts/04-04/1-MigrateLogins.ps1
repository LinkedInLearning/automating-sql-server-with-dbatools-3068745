<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
04-04 - Migrating logins
-------------------------------------
#>

# View the logins on dbatools1
Get-DbaLogin -SqlInstance dbatools1 |
Select-Object SqlInstance, Name, LoginType

# View the database users for pubs
Get-DbaDbUser -SqlInstance dbatools1 -Database Northwind -ExcludeSystemUser |
Select-Object SqlInstance, Database, Name, Login

# View the database users for pubs
Get-DbaDbUser -SqlInstance dbatools2 -Database Northwind -ExcludeSystemUser |
Select-Object SqlInstance, Database, Name, Login

# Create a login for TestOrphan1
New-DbaLogin -SqlInstance dbatools2 -Login TestOrphan1

# View Orphan users
Get-DbaDbOrphanUser -SqlInstance dbatools2

# Repair Orphan users
Repair-DbaDbOrphanUser -SqlInstance dbatools2

# Copy the login with dbatools
$loginSplat = @{
    Source = 'dbatools1'
    Destination = 'dbatools2'
    Login = 'webuser'
}
Copy-DbaLogin @loginSplat

# Check for any orphan users
Get-DbaDbOrphanUser -SqlInstance dbatools2