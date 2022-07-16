<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
01-04 - Running your first command
-------------------------------------
#>

## Get help on how to use a command
Get-Help Test-DbaDbCompression

# Open up a seperate window with the full help - this won't work here since we're running in a container, but good on Windows machines
Get-Help Test-DbaDbCompression -ShowWindow

# Open up the online help pages
Get-Help Test-DbaDbCompression -Online

# View examples on how to use the command
Get-Help Test-DbaDbCompression -Examples

# Using one of the examples from the Test-DbaDbCompression help
Test-DbaDbCompression -SqlInstance $dbatools1
