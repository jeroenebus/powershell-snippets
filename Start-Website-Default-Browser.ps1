# Script to create a application shortcut in the all users startup folder.
# Application shortcut will start "Website" at user login.

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
