$arr = @()

 get-service msExchange* | ? { 
	$_.StartType -eq "Automatic" } | % {
   $hash = @{           
        StartType       = $_.StartType                 
        Name             = $_.Name              
        DisplayName       = $_.DisplayName            
				}
			
    $Object = New-Object PSObject -Property $hash  	
		$arr += $Object		
				}
				
				
		$arr | ConvertTo-Json | Out-File ExchangeServices.json
				
				 