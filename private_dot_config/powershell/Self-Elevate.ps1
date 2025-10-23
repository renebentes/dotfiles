$isElevated = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)

function Test-IsSudoEnabled {
    $key = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Sudo'
    $value = 'Enabled'

    if (-not (Test-Path -Path $key -PathType Container)) {
        return $false
    }

    if (-not (Get-ItemProperty -Path $key -Name $value)) {
        return $false
    }

    return [bool](Get-ItemPropertyValue -Path $key -Name $value)
}

function Invoke-Elevation {
    param (
        [System.IO.FileInfo]$Path
    )

    $arguments = @('-NoLogo', '-NoProfile', '-NonInteractive', '-ExecutionPolicy', 'RemoteSigned', '-File', "`"$Path`"")

    if (Test-IsSudoEnabled) {
        & sudo --preserve-env pwsh @arguments
    }
    else {
        Start-Process -FilePath 'pwsh' -ArgumentList $arguments -Verb RunAs -WindowStyle Hidden -PassThru -Wait
        exit $process.ExitCode
    }
}
