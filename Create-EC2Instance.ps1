#This PowerShell Script will create a EC2 Instances in AWS Cloud Services

Write-Host "Importing AWS .NetCore module...`n"
#Import-Module AWSPowerShell.NetCore -Force -Verbose

Get-AWSPowerShellVersion

$AccessKey ="BX9dzKEcfndDsXMoYo"
$SecretKey ="mTefGD7clDsXMoYsDsXMoY9vkfKmOmMs"
$KeyPairName="EC2PSKeyPair"
$Region ="us-east-1"
$Tag=@{ Key="webserver"; Value="production" }
$Tags = new-object Amazon.EC2.Model.TagSpecification
$Tags.ResourceType = "instance"
$Tags.Tags.Add($Tag)

#Type name of the profile you desire
Set-AWSCredential -AccessKey $AccessKey -SecretKey $SecretKey -StoreAs paulprofile 

Set-AWSCredential -ProfileName paulprofile

$KeyPairName="EC2PSKeyPair"
$Region ="us-east-1"
$Tag=@{ Key="webserver"; Value="production" }
$Tags = new-object Amazon.EC2.Model.TagSpecification
$Tags.ResourceType = "instance"
$Tags.Tags.Add($Tag)

#Create a new VPC 
$VPC_CIDR = '10.0.0.0/16'
$VPC = New-EC2VPC -CidrBlock $VPC_CIDR -Region $Region

#Enable VPC DNS Settings
Edit-EC2VPCAttribute -VPCId $VPC.VPCId -EnableDnsSupport $True -Region $Region
#Enable DNS Resolution in public for EC2 Instances
Edit-EC2VpcAttribute -VPCId $VPC.VPCId -EnableDnsHostnames $True -Region $Region

#Create and Associate Internet Gateway
$InternetGateway = New-EC2InternetGateway -Region $Region
Add-EC2InternetGateway -InternetGatewayId $internetGateway.InternetGatewayId –VPCId $VPC.VpcId -Region $Region

#Create a Route Table
$RouteTable = New-EC2RouteTable -VpcId $vpc.VpcId -Region $Region
New-EC2Route -GatewayId $internetGateway.InternetGatewayId -RouteTableId $RouteTable.RouteTableId -DestinationCidrBlock '0.0.0.0/0' -Region $Region

#Create and Register the subnet
$Subnet = New-EC2Subnet -VpcId $vpc.VpcId -CidrBlock '10.0.1.0/24' -Region $Region
   
Register-EC2RouteTable -RouteTableId $RouteTable.RouteTableId -SubnetId $Subnet.SubnetId -Region $Region

$AMI = Get-SSMLatestEC2Image -Path ami-amazon-linux-latest -Region $Region -ImageName 'al2023-ami-kernel-6.1-x86_64'

#Create the EC2 Instance
New-Ec2Instance -Region $Region -ImageId $AMI -AssociatePublicIp $False -InstanceType 't2.micro' -SubnetId $Subnet.SubnetId -KeyName  $KeyPairName -TagSpecification $Tags -name

Get-EC2Instance -Region $Region | Format-Table -AutoSize



 
