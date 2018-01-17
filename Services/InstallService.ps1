 function Get-ScriptDirectory
{
    Split-Path $script:MyInvocation.MyCommand.Path
}

$path = Get-ScriptDirectory
$svcName = "Dynappix.SmartFormsService"
$filename = "$path\Dynappix.SmartFormsService.exe"

write-host $filename -ForegroundColor Green

$pwd = GC K2Service.txt

$password = $pwd | ConvertTo-SecureString -asPlainText -Force
$username = "Denallix\K2Service" 
$credential = New-Object System.Management.Automation.PSCredential($username,$password)

New-Service -Name $svcName `
	-BinaryPathName $filename `
	-DisplayName "Dynappix SmartForms Installation Service" `
	-StartupType Manual `
	-Description "This is a test service." `
	-Credential $credential