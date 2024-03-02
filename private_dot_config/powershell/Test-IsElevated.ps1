# https://gerardog.github.io/gsudo/docs/tips/script-self-elevation#self-elevate-script
function Test-IsElevated {
    return (New-Object Security.Principal.WindowsPrincipal(
            [Security.Principal.WindowsIdentity]::GetCurrent()))
    .IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}
