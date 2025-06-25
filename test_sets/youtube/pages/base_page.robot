*** Variables ***
${ACCEPT_ALL_BTN}            css=button:has-text("Accept all")
${INPUT_SEARCH}              css=input[name="search_query"]
${SEARCH_BUTTON}             css=button.ytSearchboxComponentSearchButton
${TRENDING_TAB}              css=tp-yt-paper-item:has-text("Trending")
${TRENDING_TITILE}           css=h1 span:has-text("Trending")
${MOVIES_TAB}                css=tp-yt-paper-item:has-text("Movies")
${MOVIES_TITILE}             css=h1 span:has-text("Movies")
${LIVE_TAB}                  css=tp-yt-paper-item:has-text("Live")
${LIVE_TITILE}               css=h1 span:has-text("Live")
${MUSIC_TAB}                 css=tp-yt-paper-item:has-text("Music") >> nth=0
${MUSIC_TITILE}              css=yt-formatted-string#title:has-text("Music")
${FIRST_MUSIC}               css=a.yt-lockup-view-model-wiz__content-image >> nth=0
${MUSIC_ID}                  id=content

