*** Variables ***
${URL}                       https://www.youtube.com/
${ACCEPT_ALL_BTN}            css=button:has-text("Accept all")
${TRENDING_TAB}              css=tp-yt-paper-item:has-text("Trending")
${TRENDING_TITILE}           css=h1 span:has-text("Trending")
${MUSIC_TAB}                 css=tp-yt-paper-item:has-text("Music") >> nth=0
${MUSIC_TITILE}              css=yt-formatted-string#title:has-text("Music")
${VIDEO_ID}                  id=thumbnail
${FIRST_VIDEO}               id=thumbnail >> nth=0
${MUSIC_ID}                  id=content
${MOVIES_TAB}                css=tp-yt-paper-item:has-text("Movies")
${MOVIES_TITILE}             css=h1 span:has-text("Movies")
${LIVE_TAB}                  css=tp-yt-paper-item:has-text("Live")
${LIVE_TITILE}               css=h1 span:has-text("Live")
${SEARCH_ITERATIONS}         10
${INPUT_SEARCH}              css=input[name="search_query"]
${SEARCH_BUTTON}             css=button.ytSearchboxComponentSearchButton
${SUBSCRIBE_BUTTON}          css=button[aria-label="Subscribe"]
${SUBSCRIBE_ALERT}           Sign in to subscribe to this channel.
${ALERT_POPUP}               css=ytd-modal-with-title-and-button-renderer
${FIRST_MUSIC}               css=a.yt-lockup-view-model-wiz__content-image >> nth=0
${VIDEO_ON}                  () => !document.querySelector('video.html5-main-video').paused
${VIDEO_STOPPED}             () => document.querySelector('video.html5-main-video').paused
${VIDEO_MAIN}                css=video.html5-main-video
${COMMENT_PLACEHOLDER}       id=placeholder-area
${COMMENT_ALERT}             Sign in to continue
