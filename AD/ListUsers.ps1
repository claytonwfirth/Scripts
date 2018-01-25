
$searchbase = "OU=Departments,DC=denallix,DC=com" #Amend this to the actual OU. 

$ADUsers = Get-ADUser -Filter *  -searchbase $searchbase -Properties *

$arr = @()

$ADUsers | % {
  $hash = @{           
		Department = $_.Department                 
		UserName = $_.sAMAccountname           
Description = $_.Description
DisplayName		 = $_.DisplayName
	}
			
	$Object = New-Object PSObject -Property $hash  	
	$arr += $Object		
}
				
	#$user
	#Start-Process cmd /c -Credential $cred -ErrorAction SilentlyContinue

	$arr



