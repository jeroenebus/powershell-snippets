# Grab the owner of explorer
$proc = Get-CimInstance Win32_Process -Filter "name = 'explorer.exe'"

# You might have multiple instances of explorer running, so we pick the first one
$domain = Invoke-CimMethod -InputObject $proc[0] -MethodName GetOwner | select-object -ExpandProperty Domain
$username = Invoke-CimMethod -InputObject $proc[0] -MethodName GetOwner | select-object -ExpandProperty User

# Combine the domain prefix with the username
$fullupn = "$domain\$username"
