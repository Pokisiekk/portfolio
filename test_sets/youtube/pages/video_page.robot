*** Settings ***
Library         Browser

*** Variables ***
${VIDEO_ON}                  () => document.querySelectorAll('video.html5-main-video')[0]?.paused === false
${VIDEO_STOPPED}             () => document.querySelectorAll('video.html5-main-video')[0]?.paused === true
${VIDEO_MAIN}                css=#movie_player video.html5-main-video
${SUBSCRIBE_BUTTON}          css=button[aria-label^="Subscribe to "]
${LIKE_BUTTON}               css=button[aria-label^="like this video"] >> nth=0
${DISLIKE_BUTTON}            css=button[aria-label^="dislike this video" i] >> nth=0
${SHARE_BUTTON}              css=button[aria-label^="share" i]
${ALERT_POPUP}               css=ytd-modal-with-title-and-button-renderer
${COMMENT_PLACEHOLDER}       id=placeholder-area
${COMMENT_ALERT}             Sign in to continue
${SUBSCRIBE_ALERT}           Sign in to subscribe to this channel.
${LIKE_ALERT}                Sign in to make your opinion count.
${SHARE_ALERT}               Share

*** Keywords ***
Click Subscribe Button
    [Documentation]    Clicks on the subscribe button.
    Wait For Elements State    ${SUBSCRIBE_BUTTON}    visible
    Click    ${SUBSCRIBE_BUTTON}

Click Like Button
    [Documentation]    Clicks on the like button.
    Wait For Elements State    ${LIKE_BUTTON}    visible
    Click    ${LIKE_BUTTON}

Click Dislike Button
    [Documentation]    Clicks on the dislike button.
    Wait For Elements State    ${DISLIKE_BUTTON}    visible
    Click    ${DISLIKE_BUTTON}

Click Share Button
    [Documentation]    Clicks on the share button.
    Wait For Elements State    ${SHARE_BUTTON}    visible
    Click    ${SHARE_BUTTON}

Get Content from Alert Popup
    [Documentation]    Gets and returns text from the content section for an alert popup.
    Wait For Elements State    ${ALERT_POPUP}    visible
    ${text}    Get Text    ${ALERT_POPUP} #content
    RETURN    ${text}

Click On Comment Section
    [Documentation]    Scrolls the screen and clicks on the comment field under the video.
    Wait For Function    ${VIDEO_ON}
    Scroll By    ${None}    600    0    smooth
    Wait For Elements State    ${COMMENT_PLACEHOLDER}    visible
    Click    ${COMMENT_PLACEHOLDER}

Stop Video
    [Documentation]    Stops the video by clicking on it.
    Wait For Function    ${VIDEO_ON}
    Click    ${VIDEO_MAIN}
    Wait For Function    ${VIDEO_STOPPED}

Start Video
    [Documentation]    Starts the video by clicking on it.
    Click    ${VIDEO_MAIN}
    Wait For Function    ${VIDEO_ON}
