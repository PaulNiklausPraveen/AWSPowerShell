#Install Powershell Modules for AWS

#Requires -Version  Powershell 7   

If(!(Get-Module AWSPowerShell.NetCore))
 { 
 
Write-Host "`nInstalling AWSPowerShell.NetCore..." -Foreground Green

Install-Module -name AWSPowerShell.NetCore -Scope CurrentUser -Force -AllowClobber -Verbose

}

Write-Host "`n`nImporting AWS Powershell module...`n`n"
Write-Host "Importing AWS .NetCore module...`n"
Import-Module AWSPowerShell.NetCore -Force -Verbose

Set-AWSCredential `
                 -AccessKey AKIA4LHDMYQAAQPF32GZ `
                 -SecretKey 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 `
                 -StoreAs AWS-PaulProfile  #Type name of the profile you desire

Set-AWSCredentials -ProfileName AWS-PaulProfile

New-IamUser -UserName PaulPraveen -Passthru
Get-IAMUser -UserName PaulPraveen | Format-Table UserName,UserId,Arn
