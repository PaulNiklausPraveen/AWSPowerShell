#This PowerShell Script will connect to AWS Account

Install-Module -Name AWSPowerShell -Force
Import-Module -Name AWSPowerShell -Force



Set-AWSCredential `
                 -AccessKey AKIAWLB4CVqwerttyXS `
                 -SecretKey BNe9pbhi5PSzXP+KIymFvqrasdfghWyDVY `
                 -StoreAs paulprofile  #Type name of the profile you desire
