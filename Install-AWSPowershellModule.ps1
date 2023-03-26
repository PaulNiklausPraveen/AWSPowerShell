#Install Powershell Modules for AWS

#Requires -Version  Powershell 7   

If(!(Get-Module AWSPowerShell.NetCore))
 { 
 
Write-Host "`nInstalling AWSPowerShell.NetCore..." -Foreground Green

Install-Module -name AWSPowerShell.NetCore -Scope CurrentUser -Force -AllowClobber -Verbose

}

Write-Host "`n`nImporting AWS Powershell module...`n`n"

Import-Module AWSPowerShell.NetCore -Force -Verbose
 
Get-AWSPowerShellVersion


 
