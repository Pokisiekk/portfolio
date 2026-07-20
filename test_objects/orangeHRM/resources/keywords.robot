*** Settings ***
Library         Collections
Library         SeleniumLibrary
Resource        variables.robot

*** Keywords ***
Open OrangeHRM Website
    [Documentation]    Opens orangeHRM.com website with selenium configuration.
    Set Selenium Timeout    ${DEFAULT_TIMEOUT}
    Open Browser    ${URL}    ${BROWSER}
    Set Window Size    1920    1280
