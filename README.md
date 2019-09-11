# Deletion of orphoned Active Directory synced accounts inside the Okta Cloud

## OktaAPI PSM
This script uses the OktaAPI Powershell wrapper. Please download and install prior of using this script
https://github.com/gabrielsroka/OktaAPI.psm1

```bash
Install-Module OktaAPI
```
https://www.powershellgallery.com/packages/OktaAPI

## Installation
This script requires PowerShell 5 or newer
This script uses variables.
Please replace
```bash
$OktaAPIKey = "CHANGE-API-KEY"
$OktaInstance = "https://MYOKTAINSTANCE.okta.com"
```
with your Okta API Key and your Okta Instance URL.

## Issues
If you find any bugs feel free to file an issue
