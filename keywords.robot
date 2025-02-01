*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         SeleniumLibrary
Resource        variables.robot

*** Keywords ***

Check Reqres API Availability
    [Documentation]    Checks that the reqres API is available.
    ${response}    GET On Session    ${SESSION}    ${USERS}
    Status Should Be    200    ${response}

Setup Reqres API
    [Documentation]    Creates a session and checks the reqres API availability.
    Create Session    ${SESSION}    ${REQRES_URL}
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
    
Login To OrangeHRM Website
    [Documentation]    Opens orangeHRM.com website and logs in as an admin user.
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username    ${WAITING_TIME}
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath://button[@type="submit"]
    Wait Until Element Is Visible    xpath://h6[text()="Dashboard"]    ${WAITING_TIME}
