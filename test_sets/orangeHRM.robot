*** Settings ***
Resource            ../keywords.robot
Resource            ../variables.robot

Test Setup          Login To OrangeHRM Website
Test Teardown       Close Browser

*** Test Cases ***
OH-01 Employee Search
    [Documentation]    Checks that employee seach in Directory tab on oragneHRM website working
    ...                correctly.
    Click Element    xpath://a[@href='/web/index.php/directory/viewDirectory']
    Wait Until Element Is Visible    xpath://h6[text()="Directory"]    ${WAITING_TIME}
    Input Text    xpath://input[@placeholder='Type for hints...']    Rebecca
    Wait Until Element Contains    xpath://div[@role='listbox']    Rebecca Harmony    ${WAITING_TIME}
    Click Element    xpath://div[@role='listbox']
    Click Button    xpath://button[@type="submit"]
    Wait Until Element Is Visible    xpath://p[contains(normalize-space(.), "Rebecca Harmony")]    ${WAITING_TIME}
