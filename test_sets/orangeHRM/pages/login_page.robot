*** Settings ***
Library         Collections
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../pages/dashboard_page.robot

*** Variables ***
${LOGIN_USERNAME}        css:input[name="username"]
${LOGIN_PASSWORD}        css:input[name="password"]

*** Keywords ***
Login To OrangeHRM Website
    [Documentation]    Log in as an admin user.
    Wait Until Element Is Visible    ${LOGIN_USERNAME}
    Input Text    ${LOGIN_USERNAME}    ${USERNAME}
    Input Text    ${LOGIN_PASSWORD}    ${PASSWORD}
    Click Button    ${SUBMIT_BUTTON}
    Wait Until Element Is Visible    ${PAGE_TITLE}
    Element Text Should Be    ${PAGE_TITLE}    ${DASHBOARD_TITLE}