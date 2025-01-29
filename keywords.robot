*** Settings ***
Library         RequestsLibrary
Library         Collections
Resource        variables.robot

*** Keywords ***

Check Reqres API Availability
    [Documentation]    Check that reqres API is available.
    Create Session    ${SESSION}   ${REQRES_URL}
    ${response}    GET On Session    ${SESSION}    ${USERS}
    Status Should Be    200    ${response}
