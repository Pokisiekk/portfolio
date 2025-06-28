*** Variables ***
${VIDEO_ID}                  id=thumbnail
${FIRST_VIDEO}               id=video-title >> nth=0
${VIDEO_ON}                  () => document.querySelectorAll('video.html5-main-video')[0]?.paused === false
${VIDEO_STOPPED}             () => document.querySelectorAll('video.html5-main-video')[0]?.paused === true
${VIDEO_MAIN}                css=#movie_player video.html5-main-video

${SUBSCRIBE_BUTTON}          css=#subscribe-button >> text=/^Subscribe$/
${ALERT_POPUP}               css=ytd-modal-with-title-and-button-renderer
${COMMENT_PLACEHOLDER}       id=placeholder-area
