<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
01_03 - Find the command you need
-------------------------------------
#>

# Finding the commands to use

# All commands available within dbatools
Get-Command -Module dbatools

# All commands that have compression in the name
Get-Command *Compression* -Module dbatools

# BONUS from dbatools

# Search the comment based help for a pattern
Find-DbaCommand -Pattern *compression*

# Return all the commands that are tagged as 'Job'
Find-DbaCommand -Tag Job