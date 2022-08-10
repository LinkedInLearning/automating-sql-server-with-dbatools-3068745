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
Get-DbaDbUser -SqlInstance dbatools1 -Database Pubs -ExcludeSystemUser |
Select-Object SqlInstance, Database, Name, Login

