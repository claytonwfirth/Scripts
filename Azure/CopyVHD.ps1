Import-Module AzureRM

$sourceSAName = "dynappixvms"
$sourceSAContainerName = "vhds"
$sourceSAKey = "bNZHVwvxnauicVPAL7zOPITjJSYDNLkUX33HyFkoJjCK0vWkYFKleUncLYxS9c8mDrnTnCFVVNGmNgv3DFDH5g=="

$sourceContext = New-AzureStorageContext -StorageAccountName $sourceSAName  -StorageAccountKey $sourceSAKey



$destinationSAName = "k2demoresources"
 
$destinationSAKey = "a41ojjq6YUB/z6WBY80j4YQAsCj3N9SnqqsaKHUTWLczo+C3WlzxoKWLnIHBe3BDVMTJ5wL2k4cjK2IceaatsQ=="
 
$destinationContainerName = "vhds"
$destinationContext = New-AzureStorageContext –StorageAccountName $destinationSAName -StorageAccountKey $destinationSAKey

$vhdName = "K2Core61.vhd"
 
#New-AzureStorageContainer -Name $destinationContainerName -Context $destinationContext

$blobCopy = Start-AzureStorageBlobCopy  -DestContainer $destinationContainerName -DestContext $destinationContext -SrcBlob $vhdName -Context $sourceContext -SrcContainer $sourceSAContainerName



$TotalBytes = ($blobCopy | Get-AzureStorageBlobCopyState).TotalBytes

cls
while(($blobCopy | Get-AzureStorageBlobCopyState).Status -eq "Pending") {
Start-Sleep 1
$BytesCopied = ($blobCopy | Get-AzureStorageBlobCopyState).BytesCopied
$PercentCopied = [math]::Round($BytesCopied/$TotalBytes * 100,2)
Write-Progress -Activity "Blob Copy in Progress" -Status "$PercentCopied% Complete:" -PercentComplete $PercentCopied
}

 