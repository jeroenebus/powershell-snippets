$acl = Get-Acl -Path "C:\Program Files\Notepad++\plugins"
$permission = ($fullupn, 'Modify', 'ContainerInherit, ObjectInherit', 'None', 'Allow')
$rule = New-Object System.Security.AccessControl.FileSystemAccessRule $permission
$acl.SetAccessRule($rule)
$acl | Set-Acl -Path 'C:\Program Files\Notepad++\plugins'
