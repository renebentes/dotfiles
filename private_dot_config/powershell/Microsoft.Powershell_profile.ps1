Import-Module posh-git
Import-Module PSReadLine
Install-Module PSFzf

if ($env:WT_SESSION) {
    Set-PsFzfOption -TabExpansion -GitKeyBindings
}
else {
    Set-PsFzfOption -TabExpansion
}

$env:POSH_GIT_ENABLED = $true
oh-my-posh --init --shell pwsh --config "~\.config\oh-my-posh\renebentes.omp.json" | Invoke-Expression

[console]::InputEncoding = [console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

function Set-Location-Dev {
    Set-Location -Path E:\dev
}

function Invoke-Elevation {
    if ($args.Length -eq 1) {
        Start-Process $args[0] -verb "runAs"
    }
    if ($args.Length -gt 1) {
        Start-Process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
    }
}

function Set-Location-Chezmoi {
    Set-Location -Path "~\.local\share\chezmoi"
}

Set-Alias -Name chez -Value Set-Location-Chezmoi
Set-Alias -Name dev -Value Set-Location-Dev
Set-Alias -Name grep -Value Select-String
Set-Alias -Name gti -Value git

Clear-Host
Write-Host "renebentes.dev"
