*** Settings ***
Library         Collections
Library         SeleniumLibrary
Resource        ../resources/variables.robot
Resource        admin_page.robot

*** Variables ***
${TIME_TITLE}            Time
${CUSTOMERS}             xpath=//a[text()="Customers"]
${PROJECT_INFO}          xpath=//span[normalize-space(.)="Project Info"]

*** Keywords ***
Check Time Page
    [Documentation]    Checks basic operations on Time page.
    Wait Until Element Is Visible    ${PAGE_TITLE}
    Element Text Should Be    ${PAGE_TITLE}    ${TIME_TITLE}
    Click Element    ${PROJECT_INFO}
    Wait Until Element Is Visible    ${CUSTOMERS}
    Click Element    ${CUSTOMERS}
    Check Records
