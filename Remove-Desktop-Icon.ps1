<#
.Synopsis
    Cmdlet to remove a shortcut from a users desktop (OndeDrive redirected or not)
.DESCRIPTION
    This script will check what the actual desktop path is, also if the desktop is redirected to OneDrive
.EXAMPLE
    Cmdlet can be used for al kind of actions on the user's desktop
.NOTES
    Filename: Remove-Desktop-Icon.ps1
    Author: Jeroen Ebus (https://manage-the.cloud) 
    Modified date: 2023-05-09
    Version 1.0 - Release notes/details
#>

$DesktopPath = [Environment]::GetFolderPath("Desktop")
Remove-Item "$DesktopPath\Application.lnk"
