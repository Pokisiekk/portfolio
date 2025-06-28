*** Settings ***
Resource            resources/keywords.robot
Resource            pages/base_page.robot
Resource            pages/video_page.robot
Resource            pages/music_page.robot

Test Setup          Open youtube
Test Teardown       Close Browser

*** Test Cases ***
YTV-01 Subscription Without Logging
    [Documentation]    Checks that subscription functionality on youtube is possible without a
    ...                logged in account.
    Click    ${TRENDING_TAB}
    Wait For Elements State    ${FIRST_VIDEO}    visible
    Click    ${FIRST_VIDEO}
    Wait For Elements State    ${SUBSCRIBE_BUTTON}    visible
    Click    ${SUBSCRIBE_BUTTON}
    Wait For Elements State    ${ALERT_POPUP}    visible
    ${text}    Get Text    ${ALERT_POPUP} #content
    Should Be Equal As Strings    ${text}    ${SUBSCRIBE_ALERT}

YTV-02 Comment Without Logging
    [Documentation]    Checks that commenting videos on youtube is possible without a logged in
    ...                account.
    Click    ${MUSIC_TAB}
    Wait For Elements State    ${FIRST_MUSIC}    visible
    Click    ${FIRST_MUSIC}
    Wait For Function    ${VIDEO_ON}
    Scroll By    ${None}    600    0    smooth
    Wait For Elements State    ${COMMENT_PLACEHOLDER}    visible
    Click    ${COMMENT_PLACEHOLDER}
    Wait For Elements State    ${ALERT_POPUP}    visible
    ${text}    Get Text    ${ALERT_POPUP} #content
    Should Be Equal As Strings    ${text}    ${COMMENT_ALERT}

YTV-03 Start And Stop Video
    [Documentation]    Checks that stopping and starting a video on youtube video works by clicking
    ...                on the video.
    Click    ${MUSIC_TAB}
    Wait For Elements State    ${FIRST_MUSIC}    visible
    Click    ${FIRST_MUSIC}
    Wait For Function    ${VIDEO_ON}
    Click    ${VIDEO_MAIN}
    Wait For Function    ${VIDEO_STOPPED}
    Click    ${VIDEO_MAIN}
    Wait For Function    ${VIDEO_ON}
