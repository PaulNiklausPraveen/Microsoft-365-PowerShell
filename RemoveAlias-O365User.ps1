#This Script will install Msonline powershell module and remove alias of the user 

#Installs Microsoft Azure Active Directory Module for Windows PowerShell
Install-Module Msonline -Force | Import-Module -Force -Verbose 

#Initiates a connection to Azure Active Directory
connect-Msolservice

#Removes the alias
Set-Mailbox -identity demouser@company.com -EmailAddresses @{Remove="demouseralias@company.com"}

#Get the alias to verify the removal
Get-Mailbox -Identity  demouser@company.com | Select -ExpandProperty emailaddresses alias

