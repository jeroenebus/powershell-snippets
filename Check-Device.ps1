<#
.Synopsis
    Little script to set a device vendor requirement on a Intune application
.DESCRIPTION
    This script will check if the vendor of a specifc device is from a certain brand (e.g HP)
.EXAMPLE
    Replace HP with every other system vender you would like to set the requirement to
.NOTES
    Filename: Check-Device.ps1
    Author: Jeroen Ebus (https://manage-the.cloud) 
    Modified date: 2023-05-09
    Version 1.0 - Release notes/details
#>

if ((Get-ItemProperty -Path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS") | Where-Object BIOSVendor -EQ HP) {  

    Write-host "HP Device"
    
}
