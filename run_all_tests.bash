#!/bin/bash

TEST_OBJECTS=(
    "reqresAPI" 
    "orangeHRM"
    "ESP32-S3"
    "youtube"
)

BASE_DIR="test_objects"
LOGS_DIR="logs"
TEMP_VENV=$(mktemp -d)

mkdir -p "${LOGS_DIR}"
python -m venv "$TEMP_VENV"

if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    VENV_ACTIVATE="$TEMP_VENV/Scripts/activate"
else
    VENV_ACTIVATE="$TEMP_VENV/bin/activate"
fi

if [ -f "$VENV_ACTIVATE" ]; then
    source "$VENV_ACTIVATE"
else
    echo "Error: Virtual environment activation script not found!"
    exit 1
fi

pip install -r requirements.txt
rfbrowser init

for TEST_OBJECT in "${TEST_OBJECTS[@]}"; do
    TEST_PATH="${BASE_DIR}/${TEST_OBJECT}/tests.robot"
    TEST_LOG_DIR="${LOGS_DIR}/${TEST_OBJECT}"
    mkdir -p "${TEST_LOG_DIR}"

    echo "Running tests for: ${TEST_OBJECT}"
    robot --outputdir "${TEST_LOG_DIR}" "${TEST_PATH}"

    if [ $? -ne 0 ]; then
        echo "Tests for ${TEST_OBJECT} failed!"
    else
        echo "Tests for ${TEST_OBJECT} completed successfully."
    fi
done

echo "All tests completed."

deactivate
rm -rf "$TEMP_VENV"
