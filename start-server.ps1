param([string]$Config = (Join-Path $PSScriptRoot 'config.example.json'))
$ErrorActionPreference = 'Stop'
$python = Join-Path $PSScriptRoot '.venv\Scripts\python.exe'
if (-not (Test-Path -LiteralPath $python)) { throw 'Run setup.ps1 first.' }
$env:PYTHONIOENCODING = 'utf-8'
& $python -m mcgs_mcp.server --config $Config
exit $LASTEXITCODE

