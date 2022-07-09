<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
01-04 - Running your first command
-------------------------------------
#>

## Get help on how to use a command
Get-Help Test-DbaDbCompression
Get-Help Test-DbaDbCompression -ShowWindow # good for windows!
Get-Help Test-DbaDbCompression -Online
Get-Help Test-DbaDbCompression -Examples

# Using one of the examples from the Test-DbaDbCompression help
Test-DbaDbCompression -SqlInstance $dbatools1