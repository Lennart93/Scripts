Function Invoke-Studio { Get-ChildItem *sln | ForEach-Object { Start-Process -FilePath $_.Name } }   
New-Alias studio Invoke-Studio               