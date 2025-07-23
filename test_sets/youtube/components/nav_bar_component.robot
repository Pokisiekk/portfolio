*** Settings ***
Library             Browser
    
*** Variables ***
${TRENDING_TAB}              css=tp-yt-paper-item:has-text("Trending")
${MOVIES_TAB}                css=tp-yt-paper-item:has-text("Movies")
${LIVE_TAB}                  css=tp-yt-paper-item:has-text("Live")
${MUSIC_TAB}                 css=tp-yt-paper-item:has-text("Music") >> nth=0
${SHORTS_TAB}                css=tp-yt-paper-item:has-text("Shorts")
${SUBSCRIPTIONS_TAB}         css=tp-yt-paper-item:has-text("Subscriptions")
${YOU_TAB}                   css=tp-yt-paper-item:has-text("You") >> nth=0
${HISTORY_TAB}               css=tp-yt-paper-item:has-text("History") >> nth=0
${GAMING_TAB}                css=tp-yt-paper-item:has-text("Gaming")
${NEWS_TAB}                  css=tp-yt-paper-item:has-text("News")

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

Select You From Nav Bar
    [Documentation]    Selects "You" from navigation bar.
    Click    ${YOU_TAB}

Select History From Nav Bar
    [Documentation]    Selects "History" from navigation bar.
    Click    ${HISTORY_TAB}

Select Gaming From Nav Bar
    [Documentation]    Selects "Gaming" from navigation bar.
    Click    ${GAMING_TAB}

Select News From Nav Bar
    [Documentation]    Selects "News" from navigation bar.
    Click    ${NEWS_TAB}
