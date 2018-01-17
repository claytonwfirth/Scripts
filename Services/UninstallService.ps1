 function Get-ScriptDirectory
{
    Split-Path $script:MyInvocation.MyCommand.Path
}

$path = Get-ScriptDirectory

$svcName = "Dynappix.SmartFormsService"
$svc = Get-Service -Name $svcName   -ErrorAction SilentlyContinue


if( $svc) {
	$service = Get-WmiObject -Class Win32_Service -Filter "Name='$svcName'"
	$service.delete()
} else {
	Write-Host "Service $svcName not installed." -ForegroundColor Cyan
}