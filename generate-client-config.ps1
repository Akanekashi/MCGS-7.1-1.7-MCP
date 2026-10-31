param([string]$Config = (Join-Path $PSScriptRoot 'config.local.json'))
$ErrorActionPreference = 'Stop'
$pythonPath = Join-Path $PSScriptRoot '.venv\Scripts\python.exe'
if (-not (Test-Path -LiteralPath $pythonPath)) { throw 'Run setup.ps1 first.' }
if (-not (Test-Path -LiteralPath $Config)) { throw 'Copy config.example.json to config.local.json and edit it first.' }
$resolvedConfig = (Resolve-Path -LiteralPath $Config).Path
$entry = @{ mcpServers = @{ 'mcgs-experimental' = @{
    command = $pythonPath
    args = @('-m', 'mcgs_mcp.server', '--config', $resolvedConfig)
    env = @{ PYTHONIOENCODING = 'utf-8' }
} } }
$target = Join-Path $PSScriptRoot 'mcp-client.local.json'
$entry | ConvertTo-Json -Depth 8 | Set-Content -LiteralPath $target -Encoding UTF8
Write-Output "Generated $target"
