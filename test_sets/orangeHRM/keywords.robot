*** Settings ***
Library         Collections
Library         SeleniumLibrary
Resource        variables.robot

*** Keywords ***
Login To OrangeHRM Website
    [Documentation]    Opens orangeHRM.com website and logs in as an admin user.
    Set Selenium Timeout    ${DEFAULT_TIMEOUT}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    name=username
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    ${SUBMIT_BUTTON}
    Wait Until Element Is Visible    ${DASHBOARD_TITLE}

Check Records
    [Documentation]    Checks that at least one matching record is found.
    Wait Until Element Is Visible    ${RECORDS_FILED} 
    Element Should Not Contain    ${RECORDS_FILED}    No Records Found

Find User By Role
    [Documentation]    Searches for users by a given role.
    [Arguments]    ${role}    ${element}
    Click Element    ${USER_ROLE}
    Wait Until Element Contains    ${LISTBOX}    ${role}
    Click Element    ${element}
    Click Button    ${SUBMIT_BUTTON}
    Check Records
