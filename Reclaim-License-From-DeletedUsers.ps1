#This Script will install Msonline powershell module and remove license from deleted users

#Installs Microsoft Azure Active Directory Module for Windows PowerShell
Install-Module Msonline

#Imports the module
Import-Module Msonline

#Initiates a connection to Azure Active Directory
connect-Msolservice

$DeletedUsers=@()

$DeletedUSers=(Get-MsolUser –ReturnDeletedUsers |  Where-Object { $_.isLicensed -eq $True}).UserPrincipalName

Foreach($DeletedUser in $DeletedUsers)
{
Restore-MsolUser -UserPrincipalName $DeletedUser

Sleep 5

$License=(get-MsolUser -UserPrincipalName $DeletedUser).licenses.AccountSkuId

Write-Host "Removing the License : $License for $DeletedUser" -ForegroundColor Yellow

Set-MsolUserLicense -UserPrincipalName $DeletedUser -RemoveLicenses $License

Remove-MsolUser -UserPrincipalName $DeletedUser -Force
 
}