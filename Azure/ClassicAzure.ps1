$settings = gc .\settings.config | ConvertFrom-Json


Add-AzureAccount
Get-AzureSubscription
Select-AzureSubscription -SubscriptionId $settings.SubscriptionId

$vm = get-azureVM "Demo-01"
$vm.vm.OSVirtualHardDisk.MediaLink = "https://demo012286.blob.core.windows.net/vhds/K2Core61.vhd"
 $vm | Update-AzureVM