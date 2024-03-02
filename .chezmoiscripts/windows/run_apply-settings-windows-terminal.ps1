$SourceFile = "$env:USERPROFILE\.config\windows-terminal\settings.json"
$DestinationFile = "$env:LOCALAPPDATA\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

Copy-Item $SourceFile $DestinationFile
