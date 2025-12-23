#!/bin/bash

TEST_PATH="test_sets/youtube/"
LOGS_DIR="logs/youtube"
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

robot --outputdir "${LOGS_DIR}" --output original.xml "${TEST_PATH}"
if [ $? -ne 0 ]; then
    robot --outputdir "${LOGS_DIR}" --rerunfailed "${LOGS_DIR}/original.xml" --output rerun.xml "${TEST_PATH}"
    rebot --outputdir "${LOGS_DIR}" --merge "${LOGS_DIR}/original.xml" "${LOGS_DIR}/rerun.xml"
fi

echo "Youtube tests completed."

deactivate
rm -rf "$TEMP_VENV"
