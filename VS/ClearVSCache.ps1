@(
"$env:TEMP"
"$env:LOCALAPPDATA\Microsoft\UnitTest"
"$env:LOCALAPPDATA\Microsoft\VisualStudio\14.0\1033\SpecificFolderCache.xml"
"$env:LOCALAPPDATA\Microsoft\VisualStudio\14.0\1033\ProjectTemplateMRU.xml"
"$env:LOCALAPPDATA\Microsoft\VisualStudio\14.0\ComponentModelCache"
"$env:LOCALAPPDATA\Microsoft\VisualStudio\14.0\Designer\ShadowCache"
"$env:LOCALAPPDATA\Microsoft\VisualStudio\14.0\ImageLibrary\cache"
"$env:LOCALAPPDATA\Microsoft\VisualStudio Services\6.0\Cache"
"$env:LOCALAPPDATA\Microsoft\WebsiteCache"
"$env:LOCALAPPDATA\NuGet\Cache"
) |% { Remove-Item -Path $_ -Recurse -Force -ErrorAction SilentlyContinue}