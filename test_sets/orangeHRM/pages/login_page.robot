*** Settings ***
Library         Collections
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        ../pages/dashboard_page.robot

*** Variables ***
${LOGIN_USERNAME}        css:input[name="username"]
${LOGIN_PASSWORD}        css:input[name="password"]
${ALERT}                 css:p.oxd-alert-content-text
${ALERT_TEXT}            Invalid credentials

*** Keywords ***
Login To OrangeHRM Website
    [Documentation]    Log in as an admin user.
    [Arguments]    ${USERNAME}=${VAILD_USERNAME}    ${PASSWORD}=${VAILD_PASSWORD}
    Enter Credentials
    Wait Until Element Is Visible    ${PAGE_TITLE}
    Element Text Should Be    ${PAGE_TITLE}    ${DASHBOARD_TITLE}

Login With Invalid Username
    [Documentation]    Try to log in with invalid username.
    Enter Credentials    ${INVAILD_USERNAME}
    Expect Login Failure

Login With Invalid Password
    [Documentation]    Try to log in with invalid password.
    Enter Credentials    PASSWORD=${INVAILD_PASSWORD}
    Expect Login Failure

Enter Credentials
    [Documentation]    Log in as an admin user.
    [Arguments]    ${USERNAME}=${VAILD_USERNAME}    ${PASSWORD}=${VAILD_PASSWORD}
    Wait Until Element Is Visible    ${LOGIN_USERNAME}
    Input Text    ${LOGIN_USERNAME}    ${USERNAME}
    Input Text    ${LOGIN_PASSWORD}    ${PASSWORD}
    Click Button    ${SUBMIT_BUTTON}

Expect Login Failure
    [Documentation]    Log in as an admin user.
    Wait Until Element Is Visible    ${ALERT}
    Element Text Should Be    ${ALERT}    ${ALERT_TEXT}
