
$searchbase = "OU=Departments,DC=denallix,DC=com" #Amend this to the actual OU. 

$ADUsers = Get-ADUser -Filter *  -searchbase $searchbase -Properties *


$ADUsers | % {
	$userName = $_.sAMAccountname
	$User = "denallix\$username"
	$password = "K2pass!" |  ConvertTo-SecureString -AsPlainText -Force


	$cred =New-Object -TypeName System.Management.Automation.PSCredential  -ArgumentList $User, $password
	
	
	write-host "Department : $($_.Department), $userName"
	#$user
	#Start-Process cmd /c -Credential $cred -ErrorAction SilentlyContinue
}



