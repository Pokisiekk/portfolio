*** Settings ***
Library         RequestsLibrary
Resource        variables.robot

*** Keywords ***

Check Reqres API Availability
    [Documentation]    Check that reqres API is available.
    Create Session    reqres_session    ${REQRES_URL}
    ${response}    GET On Session    reqres_session    /users
    Status Should Be    200    ${response}