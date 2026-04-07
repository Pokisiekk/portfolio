*** Settings ***
Library         Collections
Library         SeleniumLibrary
Resource        ../resources/variables.robot

*** Variables ***
${DIRECTORY_TITLE}       Directory
${DIRECTORY_INPUT}       css:input[placeholder="Type for hints..."]
${LISTBOX}               css:div[role="listbox"]
${WANTED_USER}           xpath=//p[contains(normalize-space(.), "${TEST_FULL_NAME}")]
${USER_ROLE}             xpath=(//div[@class="oxd-select-text-input" and normalize-space(text())="-- Select --"])[1]
${RECORDS_FILED}         xpath=//div[@class="orangehrm-horizontal-padding orangehrm-vertical-padding"]//span[contains(normalize-space(.), 'Records Found')]

*** Keywords ***
Check Directory Page
    [Documentation]    Checks basic operations on Directory page.
    Wait Until Element Is Visible    ${PAGE_TITLE}
    Element Text Should Be    ${PAGE_TITLE}    ${DIRECTORY_TITLE}
    Input Text    ${DIRECTORY_INPUT}    ${NAME}
    Wait Until Element Contains    ${LISTBOX}    ${TEST_FULL_NAME}
    Click Element    ${LISTBOX}
    Click Button    ${SUBMIT_BUTTON}
    Wait Until Element Is Visible    ${WANTED_USER}
