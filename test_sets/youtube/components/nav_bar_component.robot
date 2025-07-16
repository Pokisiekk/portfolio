*** Variables ***
${TRENDING_TAB}              css=tp-yt-paper-item:has-text("Trending")
${MOVIES_TAB}                css=tp-yt-paper-item:has-text("Movies")
${LIVE_TAB}                  css=tp-yt-paper-item:has-text("Live")
${MUSIC_TAB}                 css=tp-yt-paper-item:has-text("Music") >> nth=0

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
