### Deletion of orphoned Active Directory synced accounts inside the Okta Cloud
### Version 1.0
### 10.09.2019 by Torben Jaster
### Deletes on Active Directory deleted/deactivated Users inside the Okta Cloud for cleanup

### Import Powershell Module
Import-Module OktaAPI

### Variables
$OktaDeletionLogFile ="$PSScriptRoot\OktadeavtivatedUserdeleation.log"
$OktaAPIKey = "CHANGE-API-KEY"
$OktaInstance = "https://MYOKTAINSTANCE.okta.com"
$OktaUserLimit = 500

### Connect to Okta Instance
Connect-Okta $OktaAPIKey $OktaInstance

### Okta deactivated user deletion
 
$OktaUserRaw = Get-OktaUsers -limit $OktaUserLimit -search 'status%20eq%20"DEPROVISIONED"'
$OktaUsers = $OktaUserRaw.response.content | ConvertFrom-Json

ForEach ($OktaUser in $OktaUsers)
	{
	Remove-OktaUser -id $OktaUser.id
	$OktaLogTime = Get-Date
	$OktaLogEntry = $OktaUser.status+","+$OktaUser.profile.login+","+$OktaLogTime+",DELETED"
	Write-Host $OktaLogEntry
	Add-Content -Path $OktaDeletionLogFile -Value $OktaLogEntry
	}
