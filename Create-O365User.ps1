#This Script will install Msonline powershell module and create Office 365 user 

#Installs Microsoft Azure Active Directory Module for Windows PowerShell
Install-Module Msonline

#Imports the module
Import-Module Msonline

#Initiates a connection to Azure Active Directory
connect-Msolservice
 
#Use this cmd to get AccountSKUId for getting LicenseAssignment details
Get-MsolAccountSKU


$Password= ConvertTo-SecureString -AsPlainText "p@55w0rd@2022" -Force

New-MsolUser -DisplayName "Demo User" -FirstName "Demo" -LastName "User" -UserPrincipalName "duser@company.com"  `
-Password $Password -UsageLocation US -LicenseAssignment Company:ENTERPRISEPACK