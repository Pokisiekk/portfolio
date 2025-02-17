*** Settings ***
Library         Browser
Resource        variables.robot

*** Keywords ***
Open Luma Website
    [Documentation]    Opens Luma website in browser.
    New Browser    browser=${BROWSER}    headless=False
    New Context
    ${page}    New Page
    Go To    ${URL}    wait_until=domcontentloaded
    Set Viewport Size    1920    1080
    Click    role=button[name="AGREE"]
    Wait For Elements State    css=body    stable    timeout=15s
