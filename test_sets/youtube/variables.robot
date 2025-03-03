*** Variables ***
${URL}                   https://www.youtube.com/
${ACCEPT_ALL_BTN}        css=button:has-text("Accept all")
${TRENDING_TAB}          css=tp-yt-paper-item:has-text("Trending")
${TRENDING_TITILE}       css=h1 span:has-text("Trending")
${MUSIC_TAB}             css=tp-yt-paper-item:has-text("Music") >> nth=0
${MUSIC_TITILE}          css=yt-formatted-string#title:has-text("Music")
${VIDEO_ID}              id=thumbnail
${MUSIC_ID}              id=content
