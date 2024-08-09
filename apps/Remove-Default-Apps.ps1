Set-ExecutionPolicy RemoteSigned

Write-Output "Uninstalling default apps"
$appxprovisionedpackage = Get-AppxProvisionedPackage -Online

foreach($line in Get-Content .\manual-services.txt) {
    if ($line.StartsWith('#')){
        continue
    }  
    if ($line.Trim().Length -eq 0){
        continue
    }

    $app = $line.Trim()
    Write-Output "Trying to remove $app"

    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -AllUsers

    ($appxprovisionedpackage).Where( {$_.DisplayName -EQ $app}) | Remove-AppxProvisionedPackage -Online
}

