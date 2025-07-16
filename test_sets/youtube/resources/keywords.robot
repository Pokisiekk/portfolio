*** Settings ***
Library         Browser
Library         custom_keywords.py
Resource        variables.robot
Resource        ../pages/base_page.robot

*** Keywords ***
Open youtube
    [Documentation]    Opens youtube website.
    New Browser    headless=False    args=["--start-maximized"]
    New Context    viewport=None    locale=en-US
    New Page    ${URL}
    Click    ${ACCEPT_ALL_BTN}
