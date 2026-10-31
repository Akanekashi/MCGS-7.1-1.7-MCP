$ErrorActionPreference = 'Stop'
$python = Join-Path $PSScriptRoot '.venv\Scripts\python.exe'
if (-not (Test-Path -LiteralPath $python)) {
    & python -m venv (Join-Path $PSScriptRoot '.venv')
    if ($LASTEXITCODE -ne 0) { throw 'Failed to create Python virtual environment.' }
}
& $python -m pip install -r (Join-Path $PSScriptRoot 'requirements.lock.txt')
if ($LASTEXITCODE -ne 0) { throw 'Locked dependency installation failed.' }
& $python -m pip install -e $PSScriptRoot --no-deps
if ($LASTEXITCODE -ne 0) { throw 'Dependency installation failed.' }
Write-Output 'Installed mcgs-mcp. Run .\start-server.ps1 or the smoke test in README.md.'

