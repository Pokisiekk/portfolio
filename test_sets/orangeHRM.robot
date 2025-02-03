*** Settings ***
Resource            ../keywords.robot
Resource            ../variables.robot

Test Setup          Login To OrangeHRM Website
Test Teardown       Close Browser

*** Test Cases ***
OH-01 Employee Search
    [Documentation]    Checks that employee seach in Directory tab on oragneHRM website works
    ...                correctly.
    Click Element    xpath://a[@href='/web/index.php/directory/viewDirectory']
    Wait Until Element Is Visible    xpath://h6[text()="Directory"]    ${WAITING_TIME}
    Input Text    xpath://input[@placeholder='Type for hints...']    Rebecca
    Wait Until Element Contains    xpath://div[@role='listbox']    Rebecca Harmony    ${WAITING_TIME}
    Click Element    xpath://div[@role='listbox']
    Click Button    xpath://button[@type="submit"]
    Wait Until Element Is Visible    xpath://p[contains(normalize-space(.), "Rebecca Harmony")]    ${WAITING_TIME}

OH-02 Admin Tab
    [Documentation]    Checks that searching for people by user role in Admin tab on oragneHRM
    ...                website works correctly.
    Click Element    xpath://a[@href='/web/index.php/admin/viewAdminModule']
    Wait Until Element Is Visible    xpath://h6[text()="Admin"]    ${WAITING_TIME}
    Click Element    xpath=(//div[@class="oxd-select-text-input" and normalize-space(text())="-- Select --"])[1]
    Wait Until Element Contains    xpath://div[@role='listbox']    Admin    ${WAITING_TIME}
    Click Element    xpath=//div[@role='listbox']//*[normalize-space(text())="Admin"]
    Click Button    xpath://button[@type="submit"]
    Wait Until Element Is Visible    xpath=//div[@class="orangehrm-horizontal-padding orangehrm-vertical-padding"]//span[contains(normalize-space(.), 'Records Found')]
    Element Should Not Contain    xpath=//div[@class="orangehrm-horizontal-padding orangehrm-vertical-padding"]//span[contains(normalize-space(.), 'Records Found')]     No Records Found
    Click Element    xpath=(//button[@type="button" and normalize-space(.)="Reset"])
    Click Element    xpath=(//div[@class="oxd-select-text-input" and normalize-space(text())="-- Select --"])[1]
    Wait Until Element Contains    xpath://div[@role='listbox']    ESS    ${WAITING_TIME}
    Click Element    xpath=//div[@role='listbox']//*[normalize-space(text())="ESS"]
    Click Button    xpath://button[@type="submit"]
    Wait Until Element Is Visible    xpath=//div[@class="orangehrm-horizontal-padding orangehrm-vertical-padding"]//span[contains(normalize-space(.), 'Records Found')] 
    Element Should Not Contain    xpath=//div[@class="orangehrm-horizontal-padding orangehrm-vertical-padding"]//span[contains(normalize-space(.), 'Records Found')]    No Records Found

OH-03 Client Companies In Projects
    [Documentation]    Checks that client companies are added to the project information tab on
    ...                oragneHRM website.
    Click Element    xpath://a[@href='/web/index.php/time/viewTimeModule']
    Wait Until Element Is Visible    xpath://h6[text()="Time"]    ${WAITING_TIME}
    Click Element    xpath://span[normalize-space(.)="Project Info"]
    Wait Until Element Is Visible    xpath=//a[text()="Customers"]
    Click Element    xpath=//a[text()="Customers"]
    Wait Until Element Is Visible    xpath=//div[@class="orangehrm-horizontal-padding orangehrm-vertical-padding"]//span[contains(normalize-space(.), 'Records Found')] 
    Element Should Not Contain    xpath=//div[@class="orangehrm-horizontal-padding orangehrm-vertical-padding"]//span[contains(normalize-space(.), 'Records Found')]    No Records Found
