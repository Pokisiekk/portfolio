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
    Should Be True    ${video_count} > 5

YT-02 Music Page
    [Documentation]    Checks that music page on youtube is displayed correctly.
    Click    ${MUSIC_TAB}
    Wait For Elements State    ${MUSIC_TITILE}    visible
    ${video_count}    Get Element Count    ${MUSIC_ID}
    Should Be True    ${video_count} > 5

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
    Should Be True    ${video_count} > 5

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

YT-06 Subscription Without Logging
    [Documentation]    Checks that subscription functionality on youtube is possible without a logged in account.
    Click    ${TRENDING_TAB}
    Wait For Elements State    ${FIRST_VIDEO}    visible
    Click    ${FIRST_VIDEO}
    Wait For Elements State    ${SUBSCRIBE_BUTTON}    visible
    Click    ${SUBSCRIBE_BUTTON}
    Wait For Elements State    ${ALERT_POPUP}    visible
    ${text}    Get Text    ${ALERT_POPUP} #content
    Should Be Equal As Strings    ${text}    ${SUBSCRIBE_ALERT}

YT-07 Comment Without Logging
    [Documentation]    Checks that commenting videos on youtube is possible without a logged in account.
    Click    ${MUSIC_TAB}
    Wait For Elements State    ${FIRST_MUSIC}    visible
    Click    ${FIRST_MUSIC}
    Wait For Function    ${VIDEO_ON}
    Scroll By    ${None}    300    0    smooth
    Wait For Elements State    ${COMMENT_PLACEHOLDER}    visible
    Click    ${COMMENT_PLACEHOLDER}
    Wait For Elements State    ${ALERT_POPUP}    visible
    ${text}    Get Text    ${ALERT_POPUP} #content
    Should Be Equal As Strings    ${text}    ${COMMENT_ALERT}

YT-08 Start And Stop Video
    [Documentation]    Checks that stopping and starting a video on youtube video works by clicking on the video.
    Click    ${MUSIC_TAB}
    Wait For Elements State    ${FIRST_MUSIC}    visible
    Click    ${FIRST_MUSIC}
    Wait For Function    ${VIDEO_ON}
    Click    ${VIDEO_MAIN}
    Wait For Function    ${VIDEO_STOPPED}
    Click    ${VIDEO_MAIN}
    Wait For Function    ${VIDEO_ON}
