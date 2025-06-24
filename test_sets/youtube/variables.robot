*** Variables ***
${URL}                       https://www.youtube.com/
${SEARCH_ITERATIONS}         10
${COMMENT_ALERT}             Sign in to continue
${SUBSCRIBE_ALERT}           Sign in to subscribe to this channel.

${ACCEPT_ALL_BTN}            css=button:has-text("Accept all")
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
${VIDEO_ID}                  id=thumbnail
${FIRST_VIDEO}               id=video-title >> nth=0
${VIDEO_ON}                  () => document.querySelectorAll('video.html5-main-video')[0]?.paused === false
${VIDEO_STOPPED}             () => document.querySelectorAll('video.html5-main-video')[0]?.paused === true
${VIDEO_MAIN}                css=video.html5-main-video
${INPUT_SEARCH}              css=input[name="search_query"]
${SEARCH_BUTTON}             css=button.ytSearchboxComponentSearchButton
${SUBSCRIBE_BUTTON}          css=#subscribe-button >> text=Subscribe
${ALERT_POPUP}               css=ytd-modal-with-title-and-button-renderer
${COMMENT_PLACEHOLDER}       id=placeholder-area
