*** Settings ***
Library             Browser
    
*** Variables ***
${TRENDING_TAB}              css=tp-yt-paper-item:has-text("Trending")
${MOVIES_TAB}                css=tp-yt-paper-item:has-text("Movies")
${LIVE_TAB}                  css=tp-yt-paper-item:has-text("Live")
${MUSIC_TAB}                 css=tp-yt-paper-item:has-text("Music") >> nth=0
${SHORTS_TAB}                css=tp-yt-paper-item:has-text("Shorts")
${SUBSCRIPTIONS_TAB}         css=tp-yt-paper-item:has-text("Subscriptions")

*** Keywords ***
Select Trending From Nav Bar
    [Documentation]    Selects "Trending" from navigation bar.
    Click    ${TRENDING_TAB}

Select Music From Nav Bar
    [Documentation]    Selects "Music" from navigation bar.
    Click    ${MUSIC_TAB}

Select Movies From Nav Bar
    [Documentation]    Selects "Movies" from navigation bar.
    Click    ${MOVIES_TAB}

Select Live From Nav Bar
    [Documentation]    Selects "Live" from navigation bar.
    Click    ${LIVE_TAB}

Select Shorts From Nav Bar
    [Documentation]    Selects "Live" from navigation bar.
    Click    ${SHORTS_TAB}

Select Subscriptions From Nav Bar
    [Documentation]    Selects "Subscriptions" from navigation bar.
    Click    ${SUBSCRIPTIONS_TAB}
