*** Settings ***
Library         RequestsLibrary
Library         Collections
Resource        variables.robot

*** Keywords ***

Check Reqres API Availability
    [Documentation]    Checks that reqres API is available.
    ${response}    GET On Session    ${SESSION}    ${USERS}
    Status Should Be    200    ${response}

Setup Reqres API
    [Documentation]    Creates a session and checks reqres API availability.
    Create Session    ${SESSION}    ${REQRES_URL}
    Check Reqres API Availability
