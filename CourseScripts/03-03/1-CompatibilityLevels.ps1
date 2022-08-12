<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
03-03 - Update database compatibility levels
-------------------------------------
#>

# Get the compatibility level for the pubs database
$compatSplat = @{
    SqlInstance = 'dbatools1'
    Database    = 'pubs'
}
Get-DbaDbCompatibility @compatSplat

# Test the compatibility level for the pubs database against the server level
Test-DbaDbCompatibility @compatSplat

# Set the compatibility level for the pubs database to match the server level
Set-DbaDbCompatibility @compatSplat

# Retest the compatibility level for the pubs database against the server level
Test-DbaDbCompatibility @compatSplat
