$testPath = "test_sets/youtube/"
$logsDir = "logs/youtube"

$tempVenv = New-TemporaryFile
Remove-Item $tempVenv
$tempVenv = New-Item -ItemType Directory -Path "$($tempVenv.FullName)"

New-Item -ItemType Directory -Force -Path $logsDir | Out-Null

python -m venv $tempVenv.FullName

$venvActivate = Join-Path $tempVenv.FullName "Scripts\Activate.ps1"
if (-Not (Test-Path $venvActivate)) {
    Write-Error "Error: Virtual environment activation script not found!"
    exit 1
}

& $venvActivate
pip install -r requirements.txt
rfbrowser init

robot --outputdir $logsDir --output original.xml $testPath

Write-Host "Youtube tests completed."
Remove-Item -Recurse -Force $tempVenv
