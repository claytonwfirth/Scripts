Param (
	[string] $Id,
	[string] $Name,
	$SQLServer = "localhost",
	$DBName = "K2"	)



$path = Get-Location
$FileName = "$path\$Name.json"
$FileName


    # Export the table through the pipeline and capture the run time. Only the export is included in the run time.
    $ExportSQL = "select Json from Designer.Process where JsonId = '$id';"


#    Invoke-Sqlcmd -ServerInstance $SQLServer -Database $DBName -Query $ExportSQL | out-File  $FileName -Encoding utf8

		
function GenericSqlQuery ($Server, $Database, $SQLQuery) {
    $Connection = New-Object System.Data.SQLClient.SQLConnection
    $Connection.ConnectionString = "server='$Server';database='$Database';trusted_connection=true;"
    $Connection.Open()
    $Command = New-Object System.Data.SQLClient.SQLCommand
    $Command.Connection = $Connection
    $Command.CommandText = $SQLQuery
    $Reader = $Command.ExecuteReader()
    while ($Reader.Read()) {
         $Reader.GetValue($1)
    }
    $Connection.Close()
}


$json = GenericSqlQuery $sqlServer $DBName $exportSQL


$json | out-File  $FileName -Encoding utf8