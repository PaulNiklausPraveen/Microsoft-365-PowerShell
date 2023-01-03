#This Script will install Msonline powershell module and create Office 365 users in bulk

#Installs Microsoft Azure Active Directory Module for Windows PowerShell
Install-Module Msonline -Force | Import-Module -Force -Verbose 

#Initiates a connection to Azure Active Directory
connect-Msolservice

#To get the license details, use below cmd
Get-MsolAccountSKU

#Set the path for CSV File. CSV file should contain Displayname.FirstName,LastName,UserPrincipalName,Location,Password,Country,City,Title,Mobile
$Users=Import-Csv C:\Temp\bulkusers.csv

Foreach($User in $Users)
{

New-MsolUser -DisplayName $($User.Displayname) -FirstName $($user.FirstName) -LastName  $($User.LastName) -UserPrincipalName $($User.UserPrincipalName)  -Password $($User.Password) `
 -UsageLocation $($User.Location) -Title $($User.Title) -Country $($USer.Country) -City $($USer.City) -mobile $($User.Mobile)  
 
}
