*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         SeleniumLibrary
Library         String
Resource        variables.robot
Library         SerialLibrary    /dev/ttyACM0    baudrate=115200    encoding=utf-8

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
    Click Button    ${SUBMIT_BUTTON}
    Wait Until Element Is Visible    ${DASHBOARD_TITLE}    ${WAITING_TIME}

Check Records
    [Documentation]    Checks that at least one matching record is found.
    Wait Until Element Is Visible    ${RECORDS_FILED} 
    Element Should Not Contain    ${RECORDS_FILED}    No Records Found

Find User By Role
    [Documentation]    Searches for users by a given role.
    [Arguments]    ${role}    ${element}
    Click Element    ${USER_ROLE}
    Wait Until Element Contains    ${LISTBOX}    ${role}    ${WAITING_TIME}
    Click Element    ${element}
    Click Button    ${SUBMIT_BUTTON}
    Check Records

Connect to MicroPython
    [Documentation]    Connects with MicroPython via serial.
    Port Should Be Open
    Reset Input Buffer
    Write Data    \x0D\x0A
    Read Until    >>>

Execute command in MicroPython
    [Documentation]    Executes a given command in Micropython and returns its response.
    [Arguments]    ${command}
    Write Data    ${command}
    Write Data    \x0D\x0A
    ${output}    Read Until    >>>
    ${response}    Get Command Output    ${output}
    RETURN    ${response}

Get Command Output
    [Documentation]    Returns the command response from the entire output.
    [Arguments]    ${output}
    ${lines}    Split To Lines    ${output}
    ${filtered_lines}    Get Slice From List    ${lines}    1    -1
    ${response}=    Catenate    SEPARATOR=\n    @{filtered_lines}
    RETURN    ${response}
