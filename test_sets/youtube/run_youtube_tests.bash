#!/usr/bin/env bash
VENV="$(mktemp -d)"
python -m venv "$VENV"

if [[ "$OSTYPE" == msys* || "$OSTYPE" == win32* ]]; then
  source "$VENV/Scripts/activate"
else
  source "$VENV/bin/activate"
fi

pip install -r requirements.txt
rfbrowser init

S="test_sets/youtube/tests.robot"
L="logs/youtube"
mkdir -p "$L"

if robot -d "$L/try1" -o "$L/output1.xml" "$S"; then
  rebot --merge -d "$L" -o "$L/output.xml" -l "$L/log.html" -r "$L/report.html" "$L/output1.xml"
  exit 0
fi

if robot --rerunfailed "$L/output1.xml" -d "$L/try2" -o "$L/output2.xml" "$S"; then
  rebot --merge -d "$L" -o "$L/output.xml" -l "$L/log.html" -r "$L/report.html" "$L/output1.xml" "$L/output2.xml"
  exit 0
fi

STATUS=0
robot --rerunfailed "$L/output2.xml" -d "$L/try3" -o "$L/output3.xml" "$S" || STATUS=$?

rebot --merge -d "$L" -o "$L/output.xml" -l "$L/log.html" -r "$L/report.html" \
  "$L/output1.xml" "$L/output2.xml" "$L/output3.xml"

echo "Youtube tests completed."

deactivate
rm -rf "$TEMP_VENV"
