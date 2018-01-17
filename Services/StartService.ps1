 function Get-ScriptDirectory
{
    Split-Path $script:MyInvocation.MyCommand.Path
}

$path = Get-ScriptDirectory

$svcName = "Dynappix.SmartFormsService"
$svc = Get-Service -Name $svcName   -ErrorAction SilentlyContinue


$svc | Start-Service