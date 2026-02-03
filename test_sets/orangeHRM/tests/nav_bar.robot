*** Settings ***
Resource            ../resources/keywords.robot
Resource            ../pages/directory_page.robot
Resource            ../pages/admin_page.robot
Resource            ../pages/time_page.robot
Resource            ../components/nav_bar_component.robot

Test Setup          Run Keywords    Open OrangeHRM Website
...                 AND    Login To OrangeHRM Website
Test Teardown       Close Browser

*** Test Cases ***
OH-01 Employee Search
    [Documentation]    Checks that employee seach in Directory tab on oragneHRM website works
    ...                correctly.
    Select Directory From Nav Bar
    Wait Until Element Is Visible    ${PAGE_TITLE}
    Element Text Should Be    ${PAGE_TITLE}    ${DIRECTORY_TITLE}
    Input Text    ${DIRECTORY_INPUT}    ${NAME}
    Wait Until Element Contains    ${LISTBOX}    ${TEST_FULL_NAME}
    Click Element    ${LISTBOX}
    Click Button    ${SUBMIT_BUTTON}
    Wait Until Element Is Visible    ${WANTED_USER}

OH-02 Admin Tab
    [Documentation]    Checks that searching for people by user role in Admin tab on oragneHRM
    ...                website works correctly.
    Select Admin From Nav Bar
    Wait Until Element Is Visible    ${PAGE_TITLE}
    Element Text Should Be    ${PAGE_TITLE}    ${ADMIN_TITLE}
    Find User By Role    ${ADMIN_USER_ROLE}    ${LISTBOX_ADMIN}
    Click Element    ${RESET_BUTTON}
    Find User By Role    ${ESS_USER_ROLE}    ${LISTBOX_ESS}

OH-03 Client Companies In Projects
    [Documentation]    Checks that client companies are added to the project information tab on
    ...                oragneHRM website.
    Select Time From Nav Bar
    Wait Until Element Is Visible    ${PAGE_TITLE}
    Element Text Should Be    ${PAGE_TITLE}    ${TIME_TITLE}
    Click Element    ${PROJECT_INFO}
    Wait Until Element Is Visible    ${CUSTOMERS}
    Click Element    ${CUSTOMERS}
    Check Records
