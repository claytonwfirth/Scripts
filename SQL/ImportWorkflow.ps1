Param (
	[string] $Id,
	[string] $Name ,
	$SQLServer = "localhost",
	$DBName = "K2"	)

$path = Get-Location
$FileName = "$path\$Name.json"
$FileName 


    # Export the table through the pipeline and capture the run time. Only the export is included in the run time.
$SQL = 
@"
	declare @json nvarchar(MAX)
	SELECT @Json= BulkColumn FROM OPENROWSET(
	BULK '$FileName',
	SINGLE_CLOB) AS A;


	UPDATE Designer.Process 
	SET JSON = @JSON
	where JsonId = '$id';
"@


Invoke-Sqlcmd -ServerInstance $SQLServer -Database $DBName -Query $SQL  

		