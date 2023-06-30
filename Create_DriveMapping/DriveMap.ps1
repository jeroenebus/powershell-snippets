<#
.Synopsis
    Create a drive mapping while running in system context that runs at user logon
.DESCRIPTION
    This script will create a scheduled task while running in the system context.
    The scheduled task will run when a user logs on to a device.
    Please make sure that the Create_DriveMapping.ps1 is included.
.EXAMPLE
    Change the driveletter, description, unc path and drive name
.NOTES
    Filename: DriveMap.ps1
    Author: Jeroen Ebus (https://manage-the.cloud) 
    Modified date: 2023-06-28
    Version 1.0 - Release notes/details
#>

Start-Transcript -Path "C:\ProgramData\Organization\DriveMapping\DriveMap\Log_DriveMapping.txt"

New-PSDrive -Name "X" -Description "DriveMapping Description" -PSProvider "FileSystem" -Root "\\manage-the.cloud\drivemap$" -Scope "Global" -Persist

$drive = New-Object -ComObject shell.application
$drive.NameSpace( "W:\" ).self.name = "Example DriveMapping"

Stop-Transcript
