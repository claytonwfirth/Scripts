$requiredServices = gc .\ExchangeServices.json | ConvertFrom-Json

 
$requiredServices | % {
	Set-Service -Name $_.Name -StartupType Automatic
}

Get-ChildItem -Path IIS:\AppPools | ? {
	$_.Name -like 'MSExchange*'
} | Start-WebAppPool
