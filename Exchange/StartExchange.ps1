.\EnableExchange.ps1

get-service msExchange* | ? { 
		$_.StartType -eq "Automatic" 
} | % {
	Start-Service $_.Name
}



#start iis apps too!
$websites = @("Default Web Site", "Exchange Back End")
$websites | % {Get-WebSite -Name $_} | Start-Website 

