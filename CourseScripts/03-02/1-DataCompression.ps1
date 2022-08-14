<#
-------------------------------------
Automating SQL Server with dbatools
-------------------------------------
03-02 - Discover and apply recommended data compression levels
-------------------------------------
#>

# Find th compression commands
Get-Command *compression* -Module dbatools

# Get compression levels orders
$compressSplat = @{
    SqlInstance = 'dbatools1'
    Database    = 'Northwind'
    Table       = 'Orders'
}
Get-DbaDbCompression @compressSplat |
Select-Object SqlInstance, Database, Schema, TableName, IndexName, IndexType, DataCompression, SizeCurrent, RowCount |
Format-Table

# Test the recommended compression levels for orders
Test-DbaDbCompression @compressSplat -OutVariable TestCompress

# Set recommended compression
Set-DbaDbCompression -SqlInstance dbatools1 -InputObject $TestCompress

# View Compression again
Get-DbaDbCompression @compressSplat |
Select-Object SqlInstance, Database, Schema, TableName, IndexName, IndexType, DataCompression, SizeCurrent, RowCount |
Format-Table

# Compress all of Orders indexes
Set-DbaDbCompression @compressSplat -CompressionType Page

# View Compression again
Get-DbaDbCompression @compressSplat |
Select-Object SqlInstance, Database, Schema, TableName, IndexName, IndexType, DataCompression, SizeCurrent, RowCount |
Format-Table

# Compress the whole database
$compressDb = @{
    SqlInstance     = 'dbatools1'
    Database        = 'Northwind'
    CompressionType = 'Page'
}
Set-DbaDbCompression @compressDb

# Review the help for more parameters
Get-Help Set-DbaDbCompression -Full
