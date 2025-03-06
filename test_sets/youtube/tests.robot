*** Settings ***
Resource            keywords.robot

Test Setup          Open youtube
Test Teardown       Close Browser

*** Test Cases ***
YT-01 Trending Page
    [Documentation]    Checks that trendling page on youtube is displayed correctly.
    Click    ${TRENDING_TAB}
    Wait For Elements State    ${TRENDING_TITILE}    visible
    ${video_count}    Get Element Count    ${VIDEO_ID}
    Should Be True    ${video_count} > 10

YT-02 Music Page
    [Documentation]    Checks that music page on youtube is displayed correctly.
    Click    ${MUSIC_TAB}
    Wait For Elements State    ${MUSIC_TITILE}    visible
    ${video_count}    Get Element Count    ${MUSIC_ID}
    Should Be True    ${video_count} > 10

YT-03 Movies Page
    [Documentation]    Checks that movies page on youtube is displayed correctly.
    Click    ${MOVIES_TAB}
    Wait For Elements State    ${MOVIES_TITILE}    visible
    ${video_count}    Get Element Count    ${VIDEO_ID}
    Should Be True    ${video_count} > 5

YT-04 Live Page
    [Documentation]    Checks that live page on youtube is displayed correctly.
    Click    ${LIVE_TAB}
    Wait For Elements State    ${LIVE_TITILE}    visible
    ${video_count}    Get Element Count    ${VIDEO_ID}
    Should Be True    ${video_count} > 10

YT-05 Searching
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
