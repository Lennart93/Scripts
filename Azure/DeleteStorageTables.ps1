Param(
    [Parameter(Mandatory=$True)]
    [string]$tableNames,
    [Parameter(Mandatory=$True)]
    [string]$resourceGroupName,
    [Parameter(Mandatory=$True)]
    [string]$storageAccountLongName
)

$tableNamesArray = $tableNames.split(",")
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountLongName
$tables = Get-AzStorageTable -Context $storageAccount.Context

foreach ($tableName in $tableNamesArray) {
	If (($tables | where-object {$_.Name -eq $tableName})) {
		Write-Output "Table $tableName does exist, deleting it"
		Remove-AzStorageTable -Context $storageAccount.Context -Name $tableName -Force
		Write-Output "Table $tableName is deleted"
	}
}