<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
02-06 - Find failed SQL Agent jobs
-------------------------------------
#>

# View all our SQL agent jobs
Get-DbaAgentJob -SqlInstance $SqlInstances | Format-Table

# View SQL Agent jobs where the LastRunOutcome was not successful or unknown
Get-DbaAgentJob -SqlInstance $SqlInstances  | Where-Object LastRunOutcome -notin ('Succeeded','Unknown') -OutVariable Failed

# View the contents of the failed variable
$failed

# Get the job history for our failed jobs
$Failed | Get-DbaAgentJobHistory

# View job history for just the 'Important Report' job
Get-DbaAgentJobHistory -SqlInstance dbatools1 -Job 'Important Report'

# Fix the job
$col = @{
    Name      = 'test'
    Type      = 'varchar'
    MaxLength = 20
    Nullable  = $true
}
New-DbaDbTable -SqlInstance dbatools1 -Database pubs -Name MissingTable -ColumnMap $col

# Rerun the job and wait for completion
Start-DbaAgentJob -SqlInstance dbatools1 -Job 'Important Report' -Wait