


$server = "*.denallix.com"

set-location "HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings" 

set-location ZoneMap\Domains 

new-item $server 

set-location $server 

new-itemproperty . -Name * -Value 2 -Type DWORD




function StartChrome($username) {

$User = "denallix\$username"
$password = "K2pass!" |  ConvertTo-SecureString -AsPlainText -Force


$cred =New-Object -TypeName System.Management.Automation.PSCredential  -ArgumentList $User, $password


start-process "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" "https://k2.denallix.com/Runtime/Runtime/Form/com.K2.App.Workdesk.Form.Workdesk" -Credential $cred -LoadUserProfile
}


StartChrome ("Johnny")


