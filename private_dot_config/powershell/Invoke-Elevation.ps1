function Invoke-Elevation {
    Write-Output $MyInvocation
    Write-Output $MyInvocation.MyCommand
    if ($args.Length -eq 1) {
        Start-Process $args[0] -Verb RunAs
    }

    if ($args.Length -gt 1) {
        Start-Process $args[0] -ArgumentList $args[1..($args.Length - 1)] -Verb RunAs
    }
}
