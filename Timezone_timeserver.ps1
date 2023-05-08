# Set automatic timezone detection and set a preferred list of time servers
# 08-05-2023 NLJEBU

# Allow location services for automatic timezone detection

Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location -Name Value -Value "Allow"

# Set the Auto Time Zone Updater to start automatically 

Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\tzautoupdate -Name start -Value "3"

# Start the Windows Time service

Start-Service -Name "W32Time"

# Set a list of preferred time servers (first intern time server because port 123 is blocked on the Vanderlande network)

Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\W32Time\Parameters -Name NtpServer -Value "customtimeserver.local pool.ntp.org time.windows.com"

# Trigger the sync

w32tm /resync
w32tm /query /peers
