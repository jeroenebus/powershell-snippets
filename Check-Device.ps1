if ((Get-ItemProperty -Path "HKLM:\HARDWARE\DESCRIPTION\System\BIOS") | Where-Object BIOSVendor -EQ HP) {  

    Write-host "HP Device"
    
}
