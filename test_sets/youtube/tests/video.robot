*** Settings ***
Resource            ../resources/keywords.robot
Resource            ../pages/base_page.robot
Resource            ../pages/video_page.robot
Resource            ../pages/music_page.robot
Resource            ../pages/results_page.robot

Test Setup          Open youtube
Test Teardown       Close Browser

*** Test Cases ***
YTV-01 Subscription Without Logging
    [Documentation]    Checks that subscription functionality on youtube is possible without a
    ...                logged in account.
    Launch Video
    Click Subscribe Button
    ${text}    Get Content from Alert Popup
    Should Be Equal As Strings    ${text}    ${SUBSCRIBE_ALERT}

YTV-02 Comment Without Logging
    [Documentation]    Checks that commenting videos on youtube is possible without a logged in
    ...                account.
    Launch Video
    Click On Comment Section
    ${text}    Get Content from Alert Popup
    Should Be Equal As Strings    ${text}    ${COMMENT_ALERT}

YTV-03 Start And Stop Video
    [Documentation]    Checks that stopping and starting a video on youtube video works by clicking
    ...                on the video.
    Launch Video
    Stop Video
    Start Video

YTV-04 Like Without Logging
    [Documentation]    Checks that like videos on youtube is possible without a logged in account.
    Launch Video
    Click Like Button
    ${text}    Get Content from Alert Popup
    Should Be Equal As Strings    ${text}    ${LIKE_ALERT}

YTV-05 DisLike Without Logging
    [Documentation]    Checks that dislike videos on youtube is possible without a logged in
    ...                account.
    Launch Video
    Click Dislike Button
    ${text}    Get Content from Alert Popup
    Should Be Equal As Strings    ${text}    ${LIKE_ALERT}

YTV-06 Share Without Logging
    [Documentation]    Checks that share videos on youtube is possible without a logged in account.
    Launch Video
    Click Share Button
    Wait For Elements State    ${SHARE_ALERT}    visible

YTV-07 Save Without Logging
    [Documentation]    Checks that save videos on youtube is possible without a logged in account.
    Launch Video
    Click Save Button
    ${text}    Get Content from Alert Popup
    Should Be Equal As Strings    ${text}    ${SAVE_ALERT}

YTV-08 Full Screen
    [Documentation]    Checks that full screen option on youtube works correctly.
    Launch Video
    Click Full Screen Button
    Wait Until Keyword Succeeds    5 s    1 s    Check Fullscreen On
