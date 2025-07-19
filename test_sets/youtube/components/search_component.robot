*** Settings ***
Library             Browser

*** Variables ***
${INPUT_SEARCH}              css=input[name="search_query"]
${SEARCH_BUTTON}             css=button.ytSearchboxComponentSearchButton

*** Keywords ***
Search
    [Documentation]    Searches through the search field for the value received as an argument.
    [Arguments]    ${word}
    Wait For Elements State    ${INPUT_SEARCH}    visible
    Wait For Elements State    ${INPUT_SEARCH}    enabled
    Type Text    ${INPUT_SEARCH}    ${word}
    Wait For Elements State    ${SEARCH_BUTTON}    attached
    Wait For Elements State    ${SEARCH_BUTTON}    visible
    ${value}    Get Text    ${INPUT_SEARCH}
    Should Be Equal    ${value}    ${word}
    Click    ${SEARCH_BUTTON}
