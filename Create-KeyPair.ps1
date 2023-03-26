#This PowerShell Script will create a KeyPair

$KeyPairName="EC2PSKeyPair"
$Region ='us-east-1'
$KeyPair = New-EC2KeyPair -KeyName $KeyPairName -Region $Region

Get-EC2KeyPair -KeyName $KeyPairName -Region $Region | Format-list KeyName, KeyFingerprint 

$KeyPair.KeyMaterial | Out-File -Encoding ascii PSKeyPair.pem


<#
To Remove a KeyPair,
Remove-EC2KeyPair -KeyName $KeyPairName
#>
