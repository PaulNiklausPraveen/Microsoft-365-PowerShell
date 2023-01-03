#This Script will install Msonline powershell module and add alias to mail 

#Installs Microsoft Azure Active Directory Module for Windows PowerShell
Install-Module Msonline -Force | Import-Module 

#Initiates a connection to Azure Active Directory
connect-Msolservice

Set-Mailbox -Identity  demouser@company.com -EmailAddresses @{Add="demouseralias@company.com"}   

#Get the alias to verify the removal
Get-Mailbox -Identity  demouser@company.com | Select -ExpandProperty emailaddresses alias
 
