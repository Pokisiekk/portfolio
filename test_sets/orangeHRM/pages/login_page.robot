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
    [Arguments]    ${USERNAME}=${VAILD_USERNAME}    ${PASSWORD}=${VAILD_PASSWORD}
    Wait Until Element Is Visible    ${LOGIN_USERNAME}
    Input Text    ${LOGIN_USERNAME}    ${USERNAME}
    Input Text    ${LOGIN_PASSWORD}    ${PASSWORD}
    Click Button    ${SUBMIT_BUTTON}
    Wait Until Element Is Visible    ${PAGE_TITLE}
    Element Text Should Be    ${PAGE_TITLE}    ${DASHBOARD_TITLE}

Login With Invalid Username
    [Documentation]    Try to log in with invalid username.
    Login To OrangeHRM Website    ${INVAILD_USERNAME}

Login With Invalid Password
    [Documentation]    Try to log in with invalid password.
    Login To OrangeHRM Website    PASSWORD=${INVAILD_PASSWORD}
