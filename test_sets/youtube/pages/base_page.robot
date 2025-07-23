*** Settings ***
Library         Browser
Resource        ../components/nav_bar_component.robot
Resource        ../components/search_component.robot

*** Variables ***
${ACCEPT_ALL_BTN}            css=button:has-text("Accept all")
${INPUT_SEARCH}              css=input[name="search_query"]
${SEARCH_BUTTON}             css=button.ytSearchboxComponentSearchButton
${TRENDING_TITILE}           css=h1 span:has-text("Trending")
${MOVIES_TITILE}             css=h1 span:has-text("Movies")
${LIVE_TITILE}               css=h1 span:has-text("Live")
${MUSIC_TITILE}              css=yt-formatted-string#title:has-text("Music")
${VIDEO_ID}                  id=thumbnail
${MUSIC_ID}                  id=content
${SUB_UNLOGGED}              css=yt-formatted-string.promo-body-text
${SUB_UNLOGGED_TEXT}         Sign in to see updates from your favorite YouTube channels

*** Keywords ***
Check Trending Page
    [Documentation]    Checks that trendling page on youtube is displayed correctly.
    Wait For Elements State    ${TRENDING_TITILE}    visible
    ${video_count}    Get Element Count    ${VIDEO_ID}
    Should Be True    ${video_count} > 5

Check Music Page
    [Documentation]    Checks that music page on youtube is displayed correctly.
    Wait For Elements State    ${MUSIC_TITILE}    visible
    ${video_count}    Get Element Count    ${MUSIC_ID}
    Should Be True    ${video_count} > 5

Check Movies Page
    [Documentation]    Checks that movies page on youtube is displayed correctly.
    Wait For Elements State    ${MOVIES_TITILE}    visible
    ${video_count}    Get Element Count    ${VIDEO_ID}
    Should Be True    ${video_count} > 5

Check Live Page
    [Documentation]    Checks that live page on youtube is displayed correctly.
    Wait For Elements State    ${LIVE_TITILE}    visible
    ${video_count}    Get Element Count    ${VIDEO_ID}
    Should Be True    ${video_count} > 5

Check Subscriptions Page
    [Documentation]    Checks that Subscriptions page on youtube is displayed correctly for a
    ...                non-logged-in user.
    Wait For Elements State    ${SUB_UNLOGGED}    visible
    ${text}    Get Text    ${SUB_UNLOGGED}
    Should Be Equal As Strings    ${text}    ${SUB_UNLOGGED_TEXT}
