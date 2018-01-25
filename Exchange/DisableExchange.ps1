get-service msExchange* | ? { 
		$_.StartType -eq "Automatic" 
} | % {
	Set-Service -Name $_.Name -StartupType Disabled
}


Get-ChildItem -Path IIS:\AppPools | ?{$_.Name -like "MSExchange*"} | Stop-WebAppPool  -ErrorAction SilentlyContinue

