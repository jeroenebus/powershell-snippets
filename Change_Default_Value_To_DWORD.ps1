<#
.Synopsis
    Little script to change the item property of the Default vaulue to a DWORD instead of a string
.DESCRIPTION
    This script will change the item property of the Default value to a DWORD instead of a string
.EXAMPLE
    Replace the path value to the desired location
.NOTES
    Filename: Change_Default_Value_To_DWORD.ps1
    Author: Jeroen Ebus (https://manage-the.cloud) 
    Modified date: 2023-08-03
    Version 1.0 - Release notes/details
#>

New-Item -Path "HKLM:\SOFTWARE\TEST"-ErrorAction SilentlyContinue
New-ItemProperty -Path "HKLM:\SOFTWARE\TEST" -Name '(Default)' -Value 0 -PropertyType DWORD
