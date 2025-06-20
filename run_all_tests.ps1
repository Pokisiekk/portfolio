$testSets = @(
    "reqresAPI",
    "orangeHRM",
    "ESP32-S3",
    "youtube"
)

$baseDir = "test_sets"
$logsDir = "logs"
$tempVenv = New-TemporaryFile
Remove-Item $tempVenv
$tempVenv = New-Item -ItemType Directory -Path "$($tempVenv.FullName)"

python -m venv $tempVenv.FullName

$venvActivate = Join-Path $tempVenv.FullName "Scripts\Activate.ps1"
if (-Not (Test-Path $venvActivate)) {
    Write-Error "Error: Virtual environment activation script not found!"
    exit 1
}

& $venvActivate
pip install -r requirements.txt
rfbrowser init
New-Item -ItemType Directory -Force -Path $logsDir | Out-Null

foreach ($testSet in $testSets) {
    $testPath = Join-Path $baseDir "$testSet\tests.robot"
    $testLogDir = Join-Path $logsDir $testSet
    New-Item -ItemType Directory -Force -Path $testLogDir | Out-Null

    Write-Host "Running tests for: $testSet"
    robot --outputdir $testLogDir $testPath

    if ($LASTEXITCODE -ne 0) {
        Write-Host "Tests for $testSet failed!" -ForegroundColor Red
    } else {
        Write-Host "Tests for $testSet completed successfully." -ForegroundColor Green
    }
}

Write-Host "All tests completed."
Remove-Item -Recurse -Force $tempVenv
