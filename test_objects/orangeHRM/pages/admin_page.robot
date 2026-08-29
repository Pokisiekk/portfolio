*** Settings ***
Library         Collections
Library         SeleniumLibrary
Resource        ../resources/variables.robot

*** Variables ***
${ADMIN_TITLE}           Admin
${LISTBOX_ADMIN}         xpath=//div[@role='listbox']//*[normalize-space(text())="Admin"]
${LISTBOX_ESS}           xpath=//div[@role='listbox']//*[normalize-space(text())="ESS"]
${RESET_BUTTON}          xpath=//button[@type="button" and normalize-space(.)="Reset"]
${LISTBOX}               css:div[role="listbox"]
${USER_ROLE}             xpath=(//div[@class="oxd-select-text-input" and normalize-space(text())="-- Select --"])[1]
${RECORDS_FIELD}         xpath=//span[contains(normalize-space(.), 'Record Found') or contains(normalize-space(.), 'Records Found')]

*** Keywords ***
Check Admin Page
    [Documentation]    Checks basic operations on Admin page.
    Wait Until Element Is Visible    ${PAGE_TITLE}
    Element Text Should Be    ${PAGE_TITLE}    ${ADMIN_TITLE}
    Find User By Role    ${ADMIN_USER_ROLE}    ${LISTBOX_ADMIN}
    Click Element    ${RESET_BUTTON}
    Find User By Role    ${ESS_USER_ROLE}    ${LISTBOX_ESS}

Find User By Role
    [Documentation]    Searches for users by a given role.
    [Arguments]    ${role}    ${element}
    Click Element    ${USER_ROLE}
    Wait Until Element Contains    ${LISTBOX}    ${role}
    Click Element    ${element}
    Click Button    ${SUBMIT_BUTTON}
    Check Records

Check Records
    [Documentation]    Checks that at least one matching record is found.
    Wait Until Element Is Visible    ${RECORDS_FIELD} 
    Element Should Not Contain    ${RECORDS_FIELD}    No Records Found
