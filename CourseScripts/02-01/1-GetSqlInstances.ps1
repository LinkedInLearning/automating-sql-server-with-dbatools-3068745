<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
02-01 - Get a list of SQL Servers in your environment
-------------------------------------
#>

# Read in your SQL Server list from a text file
Get-Content -Path './CourseScripts/02-01/SqlServers.txt'

# Use that list of servers to connect to the instances
$sqlServers = Get-Content -Path './CourseScripts/02-01/SqlServers.txt'
Connect-DbaInstance -SqlInstance $sqlServers

# Read in your SQL Server list from a csv
Import-Csv -Path './CourseScripts/02-01/SqlServers.csv'

# Use that list of servers to connect to test instances
$sqlServers = (Import-Csv -Path './CourseScripts/02-01/SqlServers.csv' | Where-Object Environment -eq 'test').SqlInstance
Connect-DbaInstance -SqlInstance $sqlServers

# Read in your SQL Server list from a database table
$sqlInstanceDb = @{
    SqlInstance = 'dbatools1'
    Database    = 'DatabaseAdmin'
    Query       = 'SELECT [SqlInstanceId], [SqlInstance], [Environment] FROM [dbo].[SqlInstances]'
}
$sqlServers = Invoke-DbaQuery @sqlInstanceDb
$sqlServers

Connect-DbaInstance -SqlInstance $sqlServers.SqlInstance

# Find Instances in your environment
Get-Help Find-DbaInstance
