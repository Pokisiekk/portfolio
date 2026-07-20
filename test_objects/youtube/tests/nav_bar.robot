*** Settings ***
Resource            ../resources/keywords.robot
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
    Check Shorts Page

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

YTN-11 Podcasts Page
    [Documentation]    Checks that Podcasts page on youtube is displayed correctly for a
    ...                non-logged-in user.
    Select Podcasts From Nav Bar
    Check Podcasts Page

YTN-12 Youtube Premium Page
    [Documentation]    Checks that Youtube Premium page on youtube is displayed correctly for a
    ...                non-logged-in user.
    Select Youtube Premium From Nav Bar
    Check Youtube Premium Page

YTN-13 Youtube Music Page
    [Documentation]    Checks that Youtube Music page on youtube is displayed correctly for a
    ...                non-logged-in user.
    IF    ${HEADLESS}
        Skip    Not supported in headless mode
    END
    Select Youtube Music From Nav Bar
    Check Youtube Music Page

YTN-14 Youtube Kids Page
    [Documentation]    Checks that Youtube Kids page on youtube is displayed correctly for a
    ...                non-logged-in user.
    Select Youtube Kids From Nav Bar
    Check Youtube Kids Page

YTN-15 Nav Bar On Different Pages
    [Documentation]    Checks that Nav bar is available and usable on different pages.
    FOR    ${page}    IN    @{PAGES}
        Run Keyword    Select ${page} From Nav Bar
        Run Keyword    Check ${page} Page
    END
