
$hosts_file = "$env:systemroot\System32\drivers\etc\hosts" 

Write-Output "" | Out-File -Encoding ASCII -Append $hosts_file
foreach($line in Get-Content .\telemetry-domains.txt) {
    if ($line.StartsWith('#')){
      continue
    }  
    if ($line.Trim().Length -eq 0){
      continue
    }
    
    $domain = $line.Trim()
    
    if (-Not (Select-String -Path $hosts_file -Pattern $domain)) {
        Write-Output "Disabling domain: $domain"
        Write-Output "0.0.0.0 $domain" | Out-File -Encoding ASCII -Append $hosts_file
    }
}
