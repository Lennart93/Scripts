$location = Get-Location
$repos = Get-ChildItem
foreach ($repo in $repos) {
	Write-Output("Going to branch ${repo.Name}")
	Set-Location $repo.Name
	git checkout master
	git branch | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 1 -and $_ -ne 'master' } | ForEach-Object { git branch -D $_ }
	Write-Output("Local branches deleted for ${repo.Name}")
	Set-Location($location)
}

Write-Output("Every local branch deleted")