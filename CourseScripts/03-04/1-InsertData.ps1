<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
03-04 - Insert data into SQL Server tables
-------------------------------------
#>

Get-Help Write-DbaDbTableData -full

$writeSplat = @{
    SqlInstance = 'dbatools1'
    Database    = 'DatabaseAdmin'
}

# Get database info into a table
Get-DbaDatabase -SqlInstance $SqlInstances |
Select-Object SqlInstance, Name, Owner, Status, LastFullBackup |
Write-DbaDataTable @writeSplat -Table DatabaseInfo -AutoCreateTable

# show ssms selcet & structure of table

# We can also create the table first & load into it
Import-Csv -Path ./CourseScripts/03-04/Customers.csv |
Write-DbaDataTable @writeSplat -Table Customers

# Using the truncate parameter to clear out the table before loading
Import-Csv -Path ./CourseScripts/03-04/Customers.csv |
Write-DbaDataTable @writeSplat -Table Customers -Truncate

# Use the BatchSize parameter to load in differnet batches (defaul 50,000)
Import-Csv -Path ./CourseScripts/03-04/Customers.csv |
Write-DbaDataTable @writeSplat -Table Customers -Truncate -BatchSize 1000
