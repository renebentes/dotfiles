Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

# These dependencies are installed by the Chezmoi scripts, so we only import them if present.
foreach ($moduleName in @('posh-git', 'PSReadLine')) {
    if (Get-Module -ListAvailable -Name $moduleName) {
        try {
            Import-Module $moduleName -ErrorAction Stop
        }
        catch {
            Write-Warning "Could not import '$moduleName': $($_.Exception.Message)"
        }
    }
}

if (Get-Module -ListAvailable -Name PSFzf) {
    Import-Module PSFzf

    if ($env:WT_SESSION) {
        Set-PsFzfOption -TabExpansion -GitKeyBindings
    }
    else {
        Set-PsFzfOption -TabExpansion
    }
}

# Only enable oh-my-posh when the executable and config are available.
$env:POSH_GIT_ENABLED = $true
$ompConfigPath = Join-Path $HOME '.config' 'oh-my-posh' 'renebentes.omp.json'
if (Get-Command oh-my-posh -ErrorAction SilentlyContinue) {
    if (Test-Path $ompConfigPath) {
        oh-my-posh --init --shell pwsh --config $ompConfigPath | Invoke-Expression
    }
}

[console]::InputEncoding = [console]::OutputEncoding = [System.Text.UTF8Encoding]::new()

function Set-Location-Dev {
    $devPath = 'E:\dev'

    if (Test-Path $devPath) {
        Set-Location -Path $devPath
        return
    }

    Write-Host "Directory not found: $devPath"
}

function Invoke-Elevation {
    param(
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$FilePath,

        [Parameter(Position = 1)]
        [string[]]$ArgumentList = @()
    )

    $resolvedPath = $FilePath
    if (-not (Test-Path -Path $resolvedPath)) {
        $commandInfo = Get-Command $resolvedPath -ErrorAction SilentlyContinue
        if ($null -eq $commandInfo) {
            throw "File or command not found: $FilePath"
        }

        $resolvedPath = $commandInfo.Source
    }

    Start-Process -FilePath $resolvedPath -ArgumentList $ArgumentList -Verb RunAs
}

function Set-Location-Chezmoi {
    $chezmoiPath = Join-Path $HOME '.local' 'share' 'chezmoi'
    if (Test-Path $chezmoiPath) {
        Set-Location -Path $chezmoiPath
    }
    else {
        Write-Host "Directory not found: $chezmoiPath"
    }
}

Set-Alias -Name chez -Value Set-Location-Chezmoi
Set-Alias -Name dev -Value Set-Location-Dev
Set-Alias -Name grep -Value Select-String
Set-Alias -Name gti -Value git

if ($Host.Name -eq 'ConsoleHost') {
    Clear-Host
}

Write-Host "renebentes.dev"
