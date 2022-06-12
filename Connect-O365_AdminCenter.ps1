#This script will connect office 365 admin center

#install the msolservice module

Install-Module Msonline

Import-Module Msonline

connect-Msolservice

#Test to confirm we are connected to Office 365 Admincenter
Get-Mailbox
