*** Settings ***
Resource            ../resources/keywords.robot
Resource            ../pages/base_page.robot
Resource            ../pages/music_page.robot
Resource            ../pages/video_page.robot

Test Setup          Open youtube
Test Teardown       Close Browser

*** Test Cases ***
YTN-01 Music Page
    [Documentation]    Checks that music page on youtube is displayed correctly.
    Select Music From Nav Bar
    Check Music Page

YTN-02 Movies Page
    [Documentation]    Checks that movies page on youtube is displayed correctly.
    Select Movies From Nav Bar
    Check Movies Page

YTN-03 Live Page
    [Documentation]    Checks that live page on youtube is displayed correctly.
    Select Live From Nav Bar
    Check Live Page

YTN-04 Shorts Page
    [Documentation]    Checks that shors page on youtube is displayed correctly.
    Select Shorts From Nav Bar
    Wait For Function    ${SHORT_ON}

YTN-05 Subscriptions Page
    [Documentation]    Checks that Subscriptions page on youtube is displayed correctly for a
    ...                non-logged-in user.
    Select Subscriptions From Nav Bar
    Check Subscriptions Page

YTN-06 You Page
    [Documentation]    Checks that You page on youtube is displayed correctly for a non-logged-in
    ...                user.
    Select You From Nav Bar
    Check You Page

YTN-07 History Page
    [Documentation]    Checks that History page on youtube is displayed correctly for a
    ...                non-logged-in user.
    Select History From Nav Bar
    Check History Page

YTN-08 Gaming Page
    [Documentation]    Checks that Gaming page on youtube is displayed correctly for a
    ...                non-logged-in user.
    Select Gaming From Nav Bar
    Check Gaming Page

YTN-09 News Page
    [Documentation]    Checks that News page on youtube is displayed correctly for a non-logged-in
    ...                user.
    Select News From Nav Bar
    Check News Page

YTN-10 Sports Page
    [Documentation]    Checks that Sports page on youtube is displayed correctly for a non-logged-in
    ...                user.
    Select Sports From Nav Bar
    Check Sports Page
