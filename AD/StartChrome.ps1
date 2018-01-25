Param (
	[string] $userName
)
$User = "denallix\$userName"
$password = "K2pass!" |  ConvertTo-SecureString -AsPlainText -Force
$cred =New-Object -TypeName System.Management.Automation.PSCredential  -ArgumentList $User, $password


$process = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"
$page = "https://k2.denallix.com/Runtime/Runtime/Form/com.K2.App.Workdesk.Form.Workdesk"


#Force a local profile to be created.. allows chrome to save passwords
Start-Process cmd /c -Credential $cred -ErrorAction SilentlyContinue


start-process $process $page -Credential $cred -LoadUserProfile 