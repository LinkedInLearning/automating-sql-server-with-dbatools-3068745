<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
02-04 - Get SQL Server patch levels
-------------------------------------
#>

# Get information about a certain build
Connect-DbaInstance -SqlInstance dbatools1
Get-DbaBuild -Build "15.0.4249"

# Get build information for your Sql instances
Get-DbaBuild -SqlInstance $SQLInstances | Format-Table

# website verison of json
# https://dbatools.io/build

# Are we on the latest build?
Test-DbaBuild -SqlInstance $SQLInstances -Latest |
Select-Object SqlInstance, Build, BuildTarget, NameLevel, SPLevel, CULevel, KBLevel, Compliant, SupportedUntil |
Format-Table

# Are we within 1CU
Test-DbaBuild -SqlInstance $SQLInstances -MaxBehind 1CU |
Select-Object SqlInstance, Build, BuildTarget, NameLevel, SPLevel, CULevel, KBLevel, Compliant, SupportedUntil |
Format-Table
