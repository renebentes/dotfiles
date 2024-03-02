Set-StrictMode -Version 3.0
$ErrorActionPreference = "Stop"

. "$env:USERPROFILE\.config\powershell\Test-IsElevated.ps1"
. "$env:USERPROFILE\.config\powershell\Invoke-Elevation.ps1"

if ((Test-IsElevated) -eq $true) {
    oh-my-posh font install CascadiaCode
}
else {
    Invoke-Elevation oh-my-posh font install CascadiaCode
}
