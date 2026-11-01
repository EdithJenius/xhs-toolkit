[CmdletBinding(SupportsShouldProcess)]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet('Login', 'Serve')]
    [string]$Action,

    [Parameter(Mandatory = $true)]
    [string]$Executable,

    [ValidateRange(1024, 65535)]
    [int]$Port = 18060,

    [string]$RuntimeDirectory = (Join-Path (Split-Path -Parent $PSScriptRoot) '.runtime/xiaohongshu-mcp')
)

$ErrorActionPreference = 'Stop'
$program = (Resolve-Path -LiteralPath $Executable).ProviderPath
if (-not (Test-Path -LiteralPath $program -PathType Leaf)) {
    throw "Executable not found: $program"
}
$runtime = $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($RuntimeDirectory)

if ($PSCmdlet.ShouldProcess($program, "$Action using runtime directory $runtime")) {
    New-Item -ItemType Directory -Path $runtime -Force | Out-Null
    Push-Location -LiteralPath $runtime
    $previousCookiesPath = [Environment]::GetEnvironmentVariable('COOKIES_PATH', 'Process')
    try {
        # The upstream defaults may fall back to the shared temp directory.
        # Keep this toolkit's login session inside its selected runtime directory.
        $env:COOKIES_PATH = Join-Path $runtime 'cookies.json'
        if ($Action -eq 'Login') {
            & $program
        } else {
            Write-Output "MCP endpoint: http://127.0.0.1:$Port/mcp"
            & $program '-port' "127.0.0.1:$Port"
        }
        if ($LASTEXITCODE -ne 0) {
            throw "Program exited with code $LASTEXITCODE"
        }
    } finally {
        if ($null -eq $previousCookiesPath) {
            Remove-Item -LiteralPath 'Env:\COOKIES_PATH' -ErrorAction SilentlyContinue
        } else {
            [Environment]::SetEnvironmentVariable('COOKIES_PATH', $previousCookiesPath, 'Process')
        }
        Pop-Location
    }
}
