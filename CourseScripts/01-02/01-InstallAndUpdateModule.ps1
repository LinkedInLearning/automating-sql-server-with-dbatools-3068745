<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
01-02 - Installing and updating the module
-------------------------------------
#>

# Find the dbatools on the PowerShell Gallery
Find-Module dbatools

# Find modules on the PowerShell Gallery using a pattern
Find-Module dba*

# Install dbatools for just your user
Install-Module dbatools

# Install dbatools for all users on your machine
Install-Module dbatools -Scope AllUsers

# Download the dbatools module and save it into a folder
Save-Module dbatools -Path c:\temp\dbatools

# Where do modules get saved?
$env:PSModulePath.split(':')
