<#
.Synopsis
    Create a drive mapping while running in system context that runs at user logon
.DESCRIPTION
    This script will create a scheduled task while running in the system context.
    The scheduled task will run when a user logs on to a device.
    Please make sure that the DriveMap.ps1 is included.
.EXAMPLE
    Give the scheduled task the desired name
.NOTES
    Filename: Create-DriveMapping.ps1
    Author: Jeroen Ebus (https://manage-the.cloud) 
    Modified date: 2023-06-28
    Version 1.0 - Release notes/details
#>

# Copy DriveMapping file to Program data

$destination = "C:\ProgramData\Organization\DriveMapping\DriveMap"
if (!(Test-Path $destination)) { New-Item $destination -Type Directory }
Copy-Item ".\DriveMap.ps1" -Destination $destination -Recurse

# Create scheduled task for Drive Mapping

$schtaskName = "DriveMapping"
$schtaskDescription = "Creates DriveMapping at user logon"

$trigger = New-ScheduledTaskTrigger -AtLogOn

$execute = 'cmd.exe'
$argument = '/c start /min "" powershell.exe -WindowStyle Hidden -ExecutionPolicy RemoteSigned -File "C:\ProgramData\Organization\DriveMapping\DriveMap.ps1"'

# Execute task in users context
$principal = New-ScheduledTaskPrincipal -GroupId "S-1-5-32-545" -Id "Author"

# Create the scheduled task 
$action = New-ScheduledTaskAction -Execute $execute -Argument $argument
$settings = New-ScheduledTaskSettingsSet -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries

$null = Register-ScheduledTask -TaskName $schtaskName -Trigger $trigger -Action $action  -Principal $principal -Settings $settings -Description $schtaskDescription -Force

# Run the scheduled task
Start-ScheduledTask -TaskName $schtaskName
