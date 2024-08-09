foreach($line in Get-Content .\manual-services.txt) {
    if($line -match $regex){
        $service = $line
        Write-Output "Setting service to manual: $service"
        try {
            Get-Service -Name $service  -ErrorAction Stop  | Set-Service -StartupType Manual -ErrorAction Stop
        }
        catch [Microsoft.PowerShell.Commands.ServiceCommandException]{
            Write-Warning $PSItem.Exception
        }
    }
}