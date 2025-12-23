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

robot --outputdir "${LOGS_DIR}" "${TEST_PATH}"

echo "Youtube tests completed."

deactivate
rm -rf "$TEMP_VENV"
