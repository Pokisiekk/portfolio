*** Settings ***
Library         Browser
Resource        variables.robot

*** Keywords ***
Open Luma Website
    [Documentation]    Opens Luma website in browser.
    New Browser    browser=${BROWSER}    headless=False
    New Context
    New Page    ${URL}
    Set Viewport Size    1920    1080
    Click    role=button[name="AGREE"]
