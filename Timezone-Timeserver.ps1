<#
.Synopsis
    Set automatic timezone detection and set a preferred list of time servers
.DESCRIPTION
    Enabled the location consent, sets the Auto Time Zone Updater service to automatically
    Start the Windows Time Server, sets a preferred list and syncs the time
.EXAMPLE
    List in NTPServer with the timeservers of your needs
.NOTES
    Filename: Timezone-Timeserver.ps1
    Author: Jeroen Ebus (https://manage-the.cloud) 
    Modified date: 2023-05-09
    Version 1.0 - Release notes/details
#>

# Allow location services for automatic timezone detection

Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location -Name Value -Value "Allow"

# Set the Auto Time Zone Updater to start automatically 

Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\tzautoupdate -Name start -Value "3"

# Start the Windows Time service

Start-Service -Name "W32Time"

# Set a list of preferred time servers

Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\W32Time\Parameters -Name NtpServer -Value "customtimeserver.local pool.ntp.org time.windows.com"

# Trigger the sync

w32tm /resync
w32tm /query /peers
