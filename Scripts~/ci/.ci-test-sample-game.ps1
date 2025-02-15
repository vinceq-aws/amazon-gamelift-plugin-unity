# Needs $env:unity_username, $env:unity_password, $env:unity_serial

$ROOT_DIR = "."
$SAMPLE_PROJECT_PATH = "$ROOT_DIR\Samples~\SampleGame"
$ABS_DIR = Resolve-Path -LiteralPath $ROOT_DIR
$ABS_LOG_DIR_PATH = "$ABS_DIR\build"
$SAMPLE_TEST_LOG_PATH="$ROOT_DIR\build\SampleGameTestLog.txt"
$TEST_ASM = "SampleTests.Unit"

echo "Running Sample tests..."

if (!(Test-Path -Path $ABS_LOG_DIR_PATH -PathType Container)) {
	mkdir -Path $ABS_LOG_DIR_PATH
}

Start-Process -FilePath "C:\Unity\Editor\Unity.exe" -Wait -NoNewWindow -ArgumentList "-batchmode -nographics -runTests -projectPath $SAMPLE_PROJECT_PATH -logFile $SAMPLE_TEST_LOG_PATH -testResults $ABS_LOG_DIR_PATH\test_results_samplegame.xml -testPlatform editmode -assemblyNames $TEST_ASM"

echo .
echo "Tests complete"