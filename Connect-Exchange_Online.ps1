#This script will connect to Exchange online

#Enter the credentials to connect to exchange online

$Username = "TYPE_USERPRINCIPALNAME_HERE"
$planePassword = 'TYPE_PASSWORD_HERE'

$password = ConvertTo-SecureString $planepassword -AsPlainText -Force
$Cred = New-Object -TypeName System.Management.Automation.PSCredential -argumentlist $Username,$password

#PSRemoting
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $Cred -Authentication Basic -AllowRedirection
#Import the session
$import = import-pssession $Session -AllowClobber
#Install MSONLINE Module
Install-module msonline -Force | Import-Module

Connect-MsolService -Credential $Cred


#Test to confirm we are connected to Exchange online
Get-Mailbox | select Name,Alias,UserPrincipalName,IsMailboxEnabled,Whenmailboxcreated   | FL
