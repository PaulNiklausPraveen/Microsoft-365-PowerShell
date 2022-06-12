#This script will connect to Exchange online

#Enter the credentials to connect to exchange online
$UserCredential = Get-Credential

$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ `
 -Credential $UserCredential -Authentication Basic -AllowRedirection

Import-PSSession $Session


#Test to confirm we are connected to Exchange online
Get-Mailbox | select Name,Alias,UserPrincipalName,IsMailboxEnabled,Whenmailboxcreated   | FL

