*** Settings ***
Library         Browser
Resource        variables.robot

*** Keywords ***

Open youtube
    [Documentation]    Opens youtube website.
    New Browser    headless=False
    New Context    viewport={'width': 1920, 'height': 1080}
    New Page    ${URL}
    Click    ${ACCEPT_ALL_BTN}
