*** Variables ***
${FIRST_VIDEO}               id=video-title >> nth=0
${VIDEO_ON}                  () => document.querySelectorAll('video.html5-main-video')[0]?.paused === false
${VIDEO_STOPPED}             () => document.querySelectorAll('video.html5-main-video')[0]?.paused === true
${VIDEO_MAIN}                css=#movie_player video.html5-main-video

${SUBSCRIBE_BUTTON}          css=#subscribe-button >> text=/^Subscribe$/
${ALERT_POPUP}               css=ytd-modal-with-title-and-button-renderer
${COMMENT_PLACEHOLDER}       id=placeholder-area

${COMMENT_ALERT}             Sign in to continue
${SUBSCRIBE_ALERT}           Sign in to subscribe to this channel.

*** Keywords ***
Video Results Changed
    [Documentation]    Compares the href value of the first video on the page with the href value of
    ...                the element given as an argument
    [Arguments]    ${old_video_href}
    ${video_href}    Get Href Of First Video
    Should Not Be Equal    ${video_href}    ${old_video_href}

Get Href Of First Video
    [Documentation]    
    ${video_href}    Get Property    ${FIRST_VIDEO}    href
    RETURN    ${video_href}