*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         custom_keywords.py
Resource        variables.robot


*** Keywords ***
Check Reqres API Availability
    [Documentation]    Checks that the reqres API is available.
    ${response}    GET On Session    ${SESSION}    ${USERS}
    Status Should Be    200    ${response}

Setup Reqres API
    [Documentation]    Creates a session and checks the reqres API availability.
    Disable Warnings
    ${headers}=    Create Dictionary    x-api-key=${API_KEY}
    Create Session    ${SESSION}    ${REQRES_URL}    ${headers}
    Check Reqres API Availability

Post Request With Dictionary
    [Documentation]    Sends a POST request with a dictionary to the reqres API.
    [Arguments]    ${request}    ${password}=${EMPTY}
    IF    '${password}' != '${EMPTY}'
        ${body}    Create Dictionary    email=${EMAIL}    password=${password}
    ELSE
        ${body}    Create Dictionary    email=${EMAIL} 
    END
    ${response}    POST On Session    ${SESSION}    ${request}    json=${body}
    ...    expected_status=any
    RETURN    ${response}
