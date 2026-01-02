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
if ($LASTEXITCODE -ne 0) {
    robot --outputdir $logsDir --rerunfailed (Join-Path $logsDir "original.xml") --output rerun1.xml $testPath
    if ($LASTEXITCODE -ne 0) {
        robot --outputdir $logsDir --rerunfailed (Join-Path $logsDir "rerun1.xml") --output rerun2.xml $testPath
        rebot --outputdir $logsDir --merge (Join-Path $logsDir "original.xml") (Join-Path $logsDir "rerun1.xml") (Join-Path $logsDir "rerun2.xml")
    }
    else {
        rebot --outputdir $logsDir --merge (Join-Path $logsDir "original.xml") (Join-Path $logsDir "rerun1.xml")
    }
}

Write-Host "Youtube tests completed."
Remove-Item -Recurse -Force $tempVenv
