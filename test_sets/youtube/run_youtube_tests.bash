#!/usr/bin/env bash

S="test_sets/youtube/tests.robot"
L="logs/youtube"
TEMP_VENV=$(mktemp -d)

mkdir -p "${L}"
python -m venv "$TEMP_VENV"

if [[ "$OSTYPE" == msys* || "$OSTYPE" == win32* ]]; then
  source "$TEMP_VENV/Scripts/activate"
else
  source "$TEMP_VENV/bin/activate"
fi

pip install -r requirements.txt
rfbrowser init

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
S="${SCRIPT_DIR}/${S}"
L="${SCRIPT_DIR}/${L}"

if [[ ! -f "$S" ]]; then
  echo "[ ERROR ] File does not exist: $S"
  deactivate
  rm -rf "$TEMP_VENV"
  exit 2
fi

if robot -d "$L/try1" -o "$L/output1.xml" "$S"; then
  rebot --merge -d "$L" -o "$L/output.xml" -l "$L/log.html" -r "$L/report.html" "$L/output1.xml"
  exit 0
fi

if [[ -f "$L/output1.xml" ]] && robot --rerunfailed "$L/output1.xml" -d "$L/try2" -o "$L/output2.xml" "$S"; then
  rebot --merge -d "$L" -o "$L/output.xml" -l "$L/log.html" -r "$L/report.html" "$L/output1.xml" "$L/output2.xml"
  exit 0
fi

STATUS=0
if [[ -f "$L/output2.xml" ]]; then
  robot --rerunfailed "$L/output2.xml" -d "$L/try3" -o "$L/output3.xml" "$S" || STATUS=$?
else
  STATUS=1
fi

XMLS=()
[[ -f "$L/output1.xml" ]] && XMLS+=("$L/output1.xml")
[[ -f "$L/output2.xml" ]] && XMLS+=("$L/output2.xml")
[[ -f "$L/output3.xml" ]] && XMLS+=("$L/output3.xml")

if (( ${#XMLS[@]} > 0 )); then
  rebot --merge -d "$L" -o "$L/output.xml" -l "$L/log.html" -r "$L/report.html" "${XMLS[@]}"
fi

echo "Youtube tests completed."

deactivate
rm -rf "$TEMP_VENV"
