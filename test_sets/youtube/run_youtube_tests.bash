#!/usr/bin/env bash
set -e

SUITE="test_sets/youtube/tests.robot"
L="logs/youtube"; mkdir -p "$L"

if robot -d "$L/try1" -o "$L/output1.xml" "$SUITE"; then
  rebot --merge -d "$L" -o "$L/output.xml" -l "$L/log.html" -r "$L/report.html" \
        "$L/output1.xml"
  exit 0
fi

if robot --rerunfailed "$L/output1.xml" -d "$L/try2" -o "$L/output2.xml" "$SUITE"; then
  rebot --merge -d "$L" -o "$L/output.xml" -l "$L/log.html" -r "$L/report.html" \
        "$L/output1.xml" "$L/output2.xml"
  exit 0
fi
