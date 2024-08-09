Write-Output "Disabling telemetry with registry"
New-FolderForced -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0