<#
.Synopsis
    Little script to set a device vendor requirement on a Intune application
.DESCRIPTION
    This script will check if the vendor of a specifc device is from a certain brand (e.g HP)
.EXAMPLE
    Replace HP with every other system vender you would like to set the requirement to
.NOTES
    Filename: Change_Default_Value_To_DWORD.ps1
    Author: Jeroen Ebus (https://manage-the.cloud) 
    Modified date: 2023-08-03
    Version 1.0 - Release notes/details
#>

New-Item -Path "HKLM:\SOFTWARE\TEST"-ErrorAction SilentlyContinue
New-ItemProperty -Path "HKLM:\SOFTWARE\TEST" -Name '(Default)' -Value 0 -PropertyType DWORD
