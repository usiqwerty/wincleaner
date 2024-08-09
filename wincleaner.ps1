#Requires -RunAsAdministrator
# & $PSScriptRoot\services\Disable-Services.ps1
# & $PSScriptRoot\services\Disable-Services-ToManual.ps1
# & $PSScriptRoot\telemetry\Disable-Domains-Telemetry-via-Host.ps1
# & $PSScriptRoot\apps\Disable-OneDrive-Integration.ps1
Get-ChildItem $PSScriptRoot\apps\ | ForEach-Object {
    & $_.FullName
  }