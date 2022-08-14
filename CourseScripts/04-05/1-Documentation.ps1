<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
04-05 - Exporting documentation
-------------------------------------
#>


$instanceSplat = @{
    SqlInstance   = $SQLInstances
    Path          = '.\Export\'
    Exclude       = 'ReplicationSettings','CentralManagementServer'
}
Export-DbaInstance @instanceSplat