*** Settings ***
Resource            ../resources/keywords.robot
Resource            ../pages/base_page.robot
Resource            ../pages/video_page.robot

Test Setup          Open youtube
Test Teardown       Close Browser

*** Test Cases ***
YTS-01 Searching
    [Documentation]    Checks that searching video functionality on youtube works correctly.
    FOR    ${iteration}    IN RANGE   ${SEARCH_ITERATIONS}
        Wait For Elements State    ${INPUT_SEARCH}    visible
        Wait For Elements State    ${INPUT_SEARCH}    enabled
        ${word}    Get Random Word
        Type Text    ${INPUT_SEARCH}    ${word}
        Wait For Elements State    ${SEARCH_BUTTON}    attached
        Wait For Elements State    ${SEARCH_BUTTON}    visible
        ${value}    Get Text    ${INPUT_SEARCH}
        Should Be Equal    ${value}    ${word}
        IF    ${iteration} > 0
            ${old_video_href}    Get Property    ${FIRST_VIDEO}    href
            Click    ${SEARCH_BUTTON}
            Wait Until Keyword Succeeds    5s    1s    Video Results Changed    ${old_video_href}
        ELSE
            Click    ${SEARCH_BUTTON}
            Wait For Elements State    ${FIRST_VIDEO}    visible
        END
    END
