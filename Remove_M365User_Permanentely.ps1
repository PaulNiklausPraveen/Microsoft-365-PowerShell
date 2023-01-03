#Set the TLS Protocol
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Installs Microsoft Azure Active Directory Module for Windows PowerShell
Install-Module Msonline -Force 

#Import the module
Import-Module Msonline -Force -Verbose 

#Initiates a connection to Azure Active Directory
connect-Msolservice

#Get all users including deleted.
Get-MsolUser -All -ReturnDeletedUsers | select UserPrincipalName,ObjectID

#Type the userprincipalname which needs to be deleted permanently
$UserPrincipalName="demouseruser@company.com"

#Permantely delete the user
Remove-MsolUser -UserPrincipalName $UserPrincipalName -Force -RemoveFromRecycleBin
