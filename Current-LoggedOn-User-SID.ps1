<#
.Synopsis
    Little script to find the SID of the logged on user when deploying in system context
.DESCRIPTION
    This script will check which user is running the explorer.exe process to determine the logged on user's SID
.EXAMPLE
    You can use the $fullupn or $currentisersid further in the script as the logged on user/sid
.NOTES
    Filename: Current-LoggedOn-User-SID.ps1
    Author: Jeroen Ebus (https://manage-the.cloud) 
    Modified date: 2023-06-14
    Version 1.0 - Release notes/details
#>

# Grab the owner of explorer
$proc = Get-CimInstance Win32_Process -Filter "name = 'explorer.exe'"

# You might have multiple instances of explorer running, so we pick the first one
$domain = Invoke-CimMethod -InputObject $proc[0] -MethodName GetOwner | select-object -ExpandProperty Domain
$username = Invoke-CimMethod -InputObject $proc[0] -MethodName GetOwner | select-object -ExpandProperty User

# Combine the domain prefix with the username
$fullupn = "$domain\$username"

# Get the SID of the logged on user based on the full UPN of the user
$currentusersid = ([System.Security.Principal.NTAccount]("$fullupn")).Translate([System.Security.Principal.SecurityIdentifier]).Value
