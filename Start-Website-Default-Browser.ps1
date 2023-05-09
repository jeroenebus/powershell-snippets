<#
.Synopsis
    Script to create a application shortcut in the all users startup folder.
.DESCRIPTION
    Application shortcut will start a specific Website in the default browser at user login.
.EXAMPLE
    Change the Website, ShortcutUrl and ShortcutIconLocation to your needs
.NOTES
    Filename: Start-Website-Default-Browser.ps1
    Author: Jeroen Ebus (https://manage-the.cloud) 
    Modified date: 2023-05-09
    Version 1.0 - Release notes/details
#>

param(
    [string]$ShortcutName = "Website",
    [string]$ShortcutUrl = "https://twitter.com/JeroenEbus",
    [string]$ShortcutIconLocation = "https://abs.twimg.com/favicons/twitter.2.ico"
)

$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut("$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Startup\$ShortcutName.lnk")
$Shortcut.TargetPath = $ShortcutUrl

if ($ShortcutIconLocation) {
    $Shortcut.IconLocation = $ShortcutIconLocation
}

$Shortcut.Save()
