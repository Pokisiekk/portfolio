#!/bin/bash

TEST_SETS=(
    "ESP32-S3"
    "orangeHRM"
    "reqresAPI"
    "youtube"
)

BASE_DIR="test_sets"
LOGS_DIR="logs"
mkdir -p ${LOGS_DIR}
.venv/Scripts/activate 

for TEST_SET in "${TEST_SETS[@]}"; do
    TEST_PATH="${BASE_DIR}/${TEST_SET}/tests.robot"
    LOG_FILE="${LOGS_DIR}/${TEST_SET}.html"

    echo "Running tests for: ${TEST_SET}"

    python -m robot --log ${LOG_FILE} ${TEST_PATH}

    if [ $? -ne 0 ]; then
        echo "Tests for ${TEST_SET} failed!"
    else
        echo "Tests for ${TEST_SET} completed successfully."
    fi
done

echo "All tests completed."
