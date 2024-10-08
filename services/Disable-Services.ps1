foreach($line in Get-Content .\disable-services.txt) {
    if($line -match $regex){
        $service = $line
        Write-Output "Disabling service: $service"
        try{
            Get-Service -Name $service  -ErrorAction Stop | Set-Service -StartupType Disabled
        }
        catch [Microsoft.PowerShell.Commands.ServiceCommandException]{
            Write-Warning $PSItem.Exception
        }
    }
}
