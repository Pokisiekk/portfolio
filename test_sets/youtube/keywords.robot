*** Settings ***
Library         Browser
Library         custom_keywords.py
Resource        variables.robot

*** Keywords ***

Open youtube
    [Documentation]    Opens youtube website.
    New Browser    headless=False    args=["--start-maximized"]
    New Context    viewport=None    locale=en-US
    New Page    ${URL}
    Click    ${ACCEPT_ALL_BTN}

Video Results Changed
    [Documentation]    Compares the href value of the first video on the page with the href value of
    ...                the element given as an argument
    [Arguments]    ${old_video_href}
    ${video_href}    Get Property    ${FIRST_VIDEO}    href
    Should Not Be Equal    ${video_href}    ${old_video_href}
