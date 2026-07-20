*** Settings ***
Library         Browser

*** Variables ***
${FIRST_VIDEO}               css=ytd-video-renderer a#video-title, ytd-rich-item-renderer a#video-title >> nth=0

*** Keywords ***
Video Results Changed
    [Documentation]    Compares the href value of the first video on the page with the href value of
    ...                the element given as an argument
    [Arguments]    ${old_video_href}
    ${video_href}    Get Href Of First Video
    Should Not Be Equal    ${video_href}    ${old_video_href}

Get Href Of First Video
    [Documentation]    Gets and returns the href from the first video on the page.
    ${video_href}    Get Property    ${FIRST_VIDEO}    href
    RETURN    ${video_href}

Select First Video
    [Documentation]    Selects the first video on the page.
    Wait For Elements State    ${FIRST_VIDEO}    visible
    Click    ${FIRST_VIDEO}
