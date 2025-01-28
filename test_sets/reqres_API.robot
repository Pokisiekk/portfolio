*** Settings ***
Resource            ../keywords.robot

*** Test Cases ***
RA-01 Checking API Availability
    [Documentation]    Check that reqres API is available.
    Check Reqres API Availability
