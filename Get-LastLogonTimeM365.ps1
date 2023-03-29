

#This PowerShell Script will get last logon time of Office 365 users.

#Security Protocol is set to TLS 1.2 version
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

$Output=@()
$ExportFile="C:\Temp\LastLogonTime.csv"

#Install MSonline and Exchange module if not available in the system 
If(!(Get-Module ExchangeOnlineManagement -ListAvailable))
 { 
Write-Host "`nInstalling ExchangeOnlineManagement . . . " -Foreground Green
Install-Module -name ExchangeOnlineManagement -Scope CurrentUser -Force -AllowClobber -Verbose
}

Get-Module -Name ExchangeOnlineManagement  -ListAvailable | Import-module -force -Verbose

#Connect to Exchange Online
Connect-ExchangeOnline

$Users=Get-Mailbox -ResultSize Unlimited | Where{$_.DisplayName -notlike "Discovery Search Mailbox"} 

ForEach($user in $users)
}
$Output+=$user | Select   UserPrincipalName,DisplayName,RecipientTypeDetails,WhenCreated ,@{N="LastLoginTime";E={(Get-MailboxStatistics -Identity $_.UserPrincipalName).lastlogontime}},IsMailboxenabled
}

$Output | Export-Csv $ExportFile -NoTypeInformation
