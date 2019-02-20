
<#PSScriptInfo

.VERSION 1.0.1

.GUID 3e6deafe-ff20-4385-9120-25a6d7611c3f

.AUTHOR Justin Trantham

.COMPANYNAME Takescake Tech

.COPYRIGHT OpenSource

.TAGS 
Sophos

.LICENSEURI 
Copyright 2019
Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

.PROJECTURI 

.ICONURI 

.EXTERNALMODULEDEPENDENCIES 

.REQUIREDSCRIPTS 

.EXTERNALSCRIPTDEPENDENCIES 

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

