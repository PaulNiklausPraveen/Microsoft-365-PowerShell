
#This Script will change the userprincipalname in M365 Tenant.

#Installs Microsoft Azure Active Directory Module for Windows PowerShell
Install-Module Msonline -Force | Import-Module -Force -Verbose 

#Initiates a connection to Azure Active Directory
connect-Msolservice

#Type the new userprincipalname 
$NewuserName= demouser1@company.com

Set-MsolUserPrincipalName -UserPrincipalName duser@company.com -NewUserPrincipalName  $NewuserName

#Verify the userprincipalname
Get-MsolUser -UserPrincipalName $NewuserName
