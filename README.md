# AWSPowerShell


To Install AWS PowerShell Script run the below line,

########################################################################################################################################################################

#Require Powershell 7   

If(!(Get-Module AWSPowerShell.NetCore))
 { 
 
Write-Host "Installing AWSPowerShell.NetCore..." -Foreground Green

Install-Module -name AWSPowerShell.NetCore -Scope CurrentUser -Force -AllowClobber -Verbose

}

Write-Host "Importing module..."
Import-Module AWSPowerShell.NetCore -Force -Verbose
 
Get-AWSPowerShellVersion


########################################################################################################################################################################
