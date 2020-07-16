Param(
    [Parameter(Mandatory=$True)]
    [string]$functionNames,
    [Parameter(Mandatory=$True)]
    [string]$resourceGroupName
)

$functionNamesArray = $functionNames.split(",")
$functionApps = Get-AzFunctionApp -ResourceGroupName $resourceGroupName

foreach ($functionName in $functionNamesArray) {
	If (($functionApps | where-object {$_.Name -eq $functionName})) {
		Write-Output("FunctionApp $functionName does exist, deleting it")
		Remove-AzFunctionApp -Name $functionName -ResourceGroupName $resourceGroupName -Force
		Write-Output("FunctionApp $functionName is deleted")
	}
}