*** Settings ***
Resource            ../resources/keywords.robot
Resource            ../pages/base_page.robot
Resource            ../pages/video_page.robot
Resource            ../pages/music_page.robot

Test Setup          Open youtube
Test Teardown       Close Browser

*** Test Cases ***
YTV-01 Subscription Without Logging
    [Documentation]    Checks that subscription functionality on youtube is possible without a
    ...                logged in account.
    Select Trending From Nav Bar
    Select First Video
    Click Subscribe Button
    ${text}    Get Content from Alert Popup
    Should Be Equal As Strings    ${text}    ${SUBSCRIBE_ALERT}

YTV-02 Comment Without Logging
    [Documentation]    Checks that commenting videos on youtube is possible without a logged in
    ...                account.
    Select Music From Nav Bar
    Select First Music
    Click On Comment Section
    ${text}    Get Content from Alert Popup
    Should Be Equal As Strings    ${text}    ${COMMENT_ALERT}

YTV-03 Start And Stop Video
    [Documentation]    Checks that stopping and starting a video on youtube video works by clicking
    ...                on the video.
    Select Music From Nav Bar
    Select First Music
    Stop Video
    Start Video
