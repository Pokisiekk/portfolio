*** Settings ***
Library         Collections
Library         SeleniumLibrary
Resource        variables.robot
Resource        ../pages/dashboard_page.robot

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
