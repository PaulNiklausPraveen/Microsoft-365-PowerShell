#Set the TLS Protocol

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Installs Microsoft Azure Active Directory Module for Windows PowerShell
Install-Module Msonline -Force 
#Import the module
Import-Module Msonline -Force -Verbose 

#Initiates a connection to Azure Active Directory
connect-Msolservice

$UserPrincipalName="demouseruser@company.com"

#Delete the user
Remove-MsolUser -UserPrincipalName  $UserPrincipalName  -Force   
