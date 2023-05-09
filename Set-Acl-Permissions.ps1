<#
.Synopsis
    Little script to set ACL permissions on a folder
.DESCRIPTION
    This script will set ACL permissions on a particular folder
.EXAMPLE
    Change the $acl (get and set) and $permission to your needs
.NOTES
    Filename: Set-Acl-Permissions.ps1
    Author: Jeroen Ebus (https://manage-the.cloud) 
    Modified date: 2023-05-09
    Version 1.0 - Release notes/details
#>

$acl = Get-Acl -Path "C:\Program Files\Notepad++\plugins"
$permission = ($fullupn, 'Modify', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule $permission
$acl.SetAccessRule($rule)
$acl | Set-Acl -Path 'C:\Program Files\Notepad++\plugins'
