*** Settings ***
Resource            ../resources/keywords.robot
Resource            ../pages/base_page.robot
Resource            ../pages/music_page.robot
Resource            ../pages/video_page.robot

Test Setup          Open youtube
Test Teardown       Close Browser

*** Test Cases ***
YTN-01 Trending Page
    [Documentation]    Checks that trendling page on youtube is displayed correctly.
    Select Trending From Nav Bar
    Check Trending Page

YTN-02 Music Page
    [Documentation]    Checks that music page on youtube is displayed correctly.
    Select Music From Nav Bar
    Check Music Page

YTN-03 Movies Page
    [Documentation]    Checks that movies page on youtube is displayed correctly.
    Select Movies From Nav Bar
    Check Movies Page

YTN-04 Live Page
    [Documentation]    Checks that live page on youtube is displayed correctly.
    Select Live From Nav Bar
    Check Live Page

YTN-05 Shorts Page
    [Documentation]    Checks that shors page on youtube is displayed correctly.
    Select Shorts From Nav Bar
    Wait For Function    ${SHORT_ON}

YTN-06 Subscriptions Page
    [Documentation]    Checks that Subscriptions page on youtube is displayed correctly for a
    ...                non-logged-in user.
    Select Subscriptions From Nav Bar
    Check Subscriptions Page

YTN-07 You Page
    [Documentation]    Checks that You page on youtube is displayed correctly for a non-logged-in
    ...                user.
    Select You From Nav Bar
    Check You Page
