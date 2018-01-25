get-service msExchange* | ? { $_.Status -eq "Running"} | Stop-Service -Force

#stop iis apps

$websites = @("Default Web Site", "Exchange Back End")
$websites | % {Get-WebSite -Name $_} | Stop-Website


Get-ChildItem -Path IIS:\AppPools | ? {
	$_.Name -like 'MSExchange*'
} | Stop-WebAppPool  -ErrorAction SilentlyContinue

