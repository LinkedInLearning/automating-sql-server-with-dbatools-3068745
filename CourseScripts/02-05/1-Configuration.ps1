<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
02-05 - Review SQL Server Configuration Settings
-------------------------------------
#>

# view the configure related commands
Get-Command *configure* -Module dbatools

# Get all configuration items
Get-DbaSpConfigure -SqlInstance $SQLInstances | Format-Table

# Get just specific configuration items
Get-DbaSpConfigure -SqlInstance dbatools1 -Name 'MaxServerMemory','AdHocDistributedQueriesEnabled'

# Enable Adhoc Queries
Set-DbaSpConfigure -SqlInstance dbatools1 -Name  'AdHocDistributedQueriesEnabled' -Value 1
Get-DbaSpConfigure -SqlInstance dbatools1 -Name 'AdHocDistributedQueriesEnabled'

# Export Configuration settings
Export-DbaSpConfigure -SqlInstance dbatools1 -Path ./Export/
