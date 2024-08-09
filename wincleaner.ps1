#Requires -RunAsAdministrator
Write-Output "wincleaner v1.0"
$folders = @('services', 'privacy', 'telemetry', 'apps')

foreach ($folder in $folders){
  Get-ChildItem $PSScriptRoot\$folder\ | ForEach-Object {
    & $_.FullName
  }
}
