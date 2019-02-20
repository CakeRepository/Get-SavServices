
<#PSScriptInfo

.VERSION 1.0.2

.GUID 3e6deafe-ff20-4385-9120-25a6d7611c3f

.AUTHOR Justin Trantham

.COMPANYNAME Takescake Tech

.TAGS 
Sophos

.LICENSEURI 
https://github.com/CakeRepository/Get-SavServices/blob/master/LICENSE

.PROJECTURI 
https://github.com/CakeRepository/Get-SavServices

.TODO
Add Write-File & Export-CSV
Determine if workstation or server and provide output if missing services

.RELEASENOTES
Version 1.0: Original published version. 
Version 1.0.1: Added -ErrorAction silentlyContinue to avoid unneeded output.
Version 1.0.2: Added MIT and other Information
#>

<# 

.DESCRIPTION 
 Gets Status on Sophos Services running on the local machine

#> 
Param()
$serviceNames = 'SAVService','SAVAdminService','Sophos AutoUpdate Service','Sophos Clean Service','Sophos Device Control Service',
        'Sophos Endpoint Defense Service','Sophos File Scanner Service','Sophos Health Service','Sophos MCS Agent','Sophos MCS Client','SophosFIM',
        'SntpService','Sophos Safestore Service','Sophos System Protection Service','Sophos Web Control Service','swi_filter','swi_service'

 $Services = $serviceNames | ForEach-Object {  
    Get-Service $_ -erroraction silentlycontinue
}
 
return $Services
