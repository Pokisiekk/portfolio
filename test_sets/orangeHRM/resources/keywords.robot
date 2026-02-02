*** Settings ***
Library         Collections
Library         SeleniumLibrary
Resource        variables.robot
Resource        ../pages/dashboard_page.robot
Resource        ../pages/login_page.robot

*** Keywords ***
Login To OrangeHRM Website
    [Documentation]    Opens orangeHRM.com website and logs in as an admin user.
    Set Selenium Timeout    ${DEFAULT_TIMEOUT}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Wait Until Element Is Visible    ${LOGIN_USERNAME}
    Input Text    ${LOGIN_USERNAME}    ${USERNAME}
    Input Text    ${LOGIN_PASSWORD}    ${PASSWORD}
    Click Button    ${SUBMIT_BUTTON}
    Wait Until Element Is Visible    ${PAGE_TITLE}
    Element Text Should Be    ${PAGE_TITLE}    ${DASHBOARD_TITLE}
