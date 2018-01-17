$outputPath = "C:\dev\K2Components\Dynappix.Sourcecode.5.0\"

$fileName = "AssemblyUpdate.json"

$projects = (Get-Content -Raw -Path $fileName | ConvertFrom-Json)

$searchPaths = @("c:\Program Files (x86)\K2 blackpearl\", "c:\Windows\assembly\")
#$projects 

$projects | % {
	
	$project = $_
	
    #write-host "Searching for files in project:$($project.Project)" -ForegroundColor Cyan

    $assemblies= $project.Assemblies

	

	$assemblies | % {
		$asmb = $_

    	$filter = $asmb.AssemblyName
	    
        
		
		foreach($path in $searchPaths) {
			#write-host "Searching for file:$($filter), in path:$path" -ForegroundColor Cyan
			
			$item = Get-ChildItem -Path "$path" -Filter $filter -Recurse -ErrorAction SilentlyContinue -Force
			
			if ($item) {
				$f = ($item  | sort-object LastWriteTimeUtc -desc)[0]
				#$f = $item[0]
				#$f
				#write-host "$item = Get-ChildItem -Path '$path' -Filter $filter -Recurse -ErrorAction SilentlyContinue -Force"	
				$asmb.FullPath = $f.FullName
				
				
				$sp = $f.FullName 
				
				$tp = "$outputPath$($project.Project)"
				
				copy-item  "$sp" "$tp" -Force -Verbose
				#write-host "$outputPath$($project.Project)" -ForegroundColor Cyan
				
				break;
			}
		}
	}

}

#
$projects | ConvertTo-Json  -depth 100 | Out-File "AssemblyUpdate2.json"