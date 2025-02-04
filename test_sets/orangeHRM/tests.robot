*** Settings ***
Resource            keywords.robot

Test Setup          Login To OrangeHRM Website
Test Teardown       Close Browser

*** Test Cases ***
OH-01 Employee Search
    [Documentation]    Checks that employee seach in Directory tab on oragneHRM website works
    ...                correctly.
    Click Element    ${DIRECTORY_TAB}
    Wait Until Element Is Visible    ${DIRECTORY_TITLE}    ${WAITING_TIME}
    Input Text    ${DIRECTORY_INPUT}    ${NAME}
    Wait Until Element Contains    ${LISTBOX}    ${TEST_FULL_NAME}    ${WAITING_TIME}
    Click Element    ${LISTBOX}
    Click Button    ${SUBMIT_BUTTON}
    Wait Until Element Is Visible    ${WANTED_USER}    ${WAITING_TIME}

OH-02 Admin Tab
    [Documentation]    Checks that searching for people by user role in Admin tab on oragneHRM
    ...                website works correctly.
    Click Element    ${ADMIN_TAB}
    Wait Until Element Is Visible    ${ADMIN_TITLE}    ${WAITING_TIME}
    Find User By Role    ${ADMIN_USER_ROLE}    ${LISTBOX_ADMIN}
    Click Element    ${RESET_BUTTON}
    Find User By Role    ${ESS_USER_ROLE}    ${LISTBOX_ESS}

OH-03 Client Companies In Projects
    [Documentation]    Checks that client companies are added to the project information tab on
    ...                oragneHRM website.
    Click Element    ${TIME_TAB}
    Wait Until Element Is Visible    ${TIME_TITLE}    ${WAITING_TIME}
    Click Element    ${PROJECT_INFO}
    Wait Until Element Is Visible    ${CUSTOMERS}
    Click Element    ${CUSTOMERS}
    Check Records
