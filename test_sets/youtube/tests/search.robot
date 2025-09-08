*** Settings ***
Resource            ../resources/keywords.robot
Resource            ../pages/base_page.robot
Resource            ../pages/video_page.robot

Test Setup          Open youtube
Test Teardown       Close Browser

*** Test Cases ***
YTS-01 Searching
    [Documentation]    Checks that searching video functionality on youtube works correctly.
    ${word}    Get Random Word
    Search    ${word}
    FOR    ${iteration}    IN RANGE   ${SEARCH_ITERATIONS}
        ${word}    Get Random Word
        ${old_video_href}    Get Href Of First Video
        Search    ${word}
        Wait Until Keyword Succeeds    5s    1s    Video Results Changed    ${old_video_href}
    END

YTS-02 Search Bar On Different Pages
    [Documentation]    Checks that search bar is available and usable on different pages.
    FOR    ${page}    IN    @{PAGES}
        ${word}    Get Random Word
        Run Keyword    Select ${page} From Nav Bar
        Wait For Load State    networkidle
        Search    ${word}
        Wait For Elements State    ${FIRST_VIDEO}    visible
    END
