*** Settings ***
Library         Collections
Library         SeleniumLibrary
Resource        ../resources/variables.robot

*** Variables ***
${DIRECTORY_TAB}         xpath=//a[@href='/web/index.php/directory/viewDirectory']
${DIRECTORY_TITLE}       xpath=//h6[text()="Directory"]
${DIRECTORY_INPUT}       xpath=//input[@placeholder='Type for hints...']
${LISTBOX}               xpath=//div[@role='listbox']
${WANTED_USER}           xpath=//p[contains(normalize-space(.), "${TEST_FULL_NAME}")]
${USER_ROLE}             xpath=(//div[@class="oxd-select-text-input" and normalize-space(text())="-- Select --"])[1]
${RECORDS_FILED}         xpath=//div[@class="orangehrm-horizontal-padding orangehrm-vertical-padding"]//span[contains(normalize-space(.), 'Records Found')]

*** Keywords ***
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
