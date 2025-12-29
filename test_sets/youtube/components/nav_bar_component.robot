*** Settings ***
Library             Browser
    
*** Variables ***
${MOVIES_TAB}                css=tp-yt-paper-item:has-text("Movies")
${LIVE_TAB}                  css=tp-yt-paper-item:has-text("Live")
${MUSIC_TAB}                 css=tp-yt-paper-item:has-text("Music") >> nth=0
${SHORTS_TAB}                css=tp-yt-paper-item:has-text("Shorts")
${SUBSCRIPTIONS_TAB}         css=tp-yt-paper-item:has-text("Subscriptions")
${YOU_TAB}                   css=tp-yt-paper-item:has-text("You") >> nth=0
${HISTORY_TAB}               css=tp-yt-paper-item:has-text("History") >> nth=0
${GAMING_TAB}                css=tp-yt-paper-item:has-text("Gaming")
${NEWS_TAB}                  css=tp-yt-paper-item:has-text("News")
${SPORTS_TAB}                css=tp-yt-paper-item:has-text("Sports")
${PODCASTS_TAB}              css=tp-yt-paper-item:has-text("Podcasts")
${YOUTUBE_PREMIUM_TAB}       css=tp-yt-paper-item:has-text("Youtube Premium")
${YOUTUBE_MUSIC_TAB}         css=tp-yt-paper-item:has-text("Youtube Music")
${YOUTUBE_KIDS_TAB}          css=tp-yt-paper-item:has-text("Youtube Kids")
${SHOW_MORE_TAB}             css=tp-yt-paper-item:has-text("Show more")

*** Keywords ***
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
    Select Show More From Nav Bar
    Click    ${GAMING_TAB}

Select News From Nav Bar
    [Documentation]    Selects "News" from navigation bar.
    Select Show More From Nav Bar
    Click    ${NEWS_TAB}

Select Sports From Nav Bar
    [Documentation]    Selects "Sports" from navigation bar.
    Select Show More From Nav Bar
    Click    ${SPORTS_TAB}

Select Podcasts From Nav Bar
    [Documentation]    Selects "Podcasts" from navigation bar.
    Select Show More From Nav Bar
    Click    ${PODCASTS_TAB}

Select Youtube Premium From Nav Bar
    [Documentation]    Selects "Youtube Premium" from navigation bar.
    Click    ${YOUTUBE_PREMIUM_TAB}

Select Youtube Music From Nav Bar
    [Documentation]    Selects "Youtube Music" from navigation bar.
    Click    ${YOUTUBE_MUSIC_TAB}
    Switch Page    NEW

Select Youtube Kids From Nav Bar
    [Documentation]    Selects "Youtube Kids" from navigation bar.
    Click    ${YOUTUBE_KIDS_TAB}
    Switch Page    NEW

Select Show More From Nav Bar
    [Documentation]    Selects "Show more" from navigation bar if visible.
    ${rc}    ${msg}=    Run Keyword And Ignore Error    Wait For Elements State    ${SHOW_MORE_TAB}    visible    timeout=1s
    IF    '${rc}' == 'PASS'
        Click    ${SHOW_MORE_TAB}
    END
