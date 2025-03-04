*** Settings ***
Resource            keywords.robot

Test Setup          Open youtube
Test Teardown       Close Browser

*** Test Cases ***
YT-01 Check Trending Page
    [Documentation]    Checks that trendling page on youtube is displayed correctly.
    Click    ${TRENDING_TAB}
    Wait For Elements State    ${TRENDING_TITILE}    visible
    ${video_count}    Get Element Count    ${VIDEO_ID}
    Should Be True    ${video_count} > 10

YT-02 Check Music Page
    [Documentation]    Checks that music page on youtube is displayed correctly.
    Click    ${MUSIC_TAB}
    Wait For Elements State    ${MUSIC_TITILE}    visible
    ${video_count}    Get Element Count    ${MUSIC_ID}
    Should Be True    ${video_count} > 10

YT-03 Check Movies Page
    [Documentation]    Checks that movies page on youtube is displayed correctly.
    Click    ${MOVIES_TAB}
    Wait For Elements State    ${MOVIES_TITILE}    visible
    ${video_count}    Get Element Count    ${VIDEO_ID}
    Should Be True    ${video_count} > 5

YT-04 Check Live Page
    [Documentation]    Checks that live page on youtube is displayed correctly.
    Click    ${LIVE_TAB}
    Wait For Elements State    ${LIVE_TITILE}    visible
    ${video_count}    Get Element Count    ${VIDEO_ID}
    Should Be True    ${video_count} > 10
