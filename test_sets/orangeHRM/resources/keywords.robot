*** Settings ***
Library         Collections
Library         SeleniumLibrary
Resource        variables.robot
Resource        ../pages/dashboard_page.robot
Resource        ../pages/login_page.robot

*** Keywords ***
Open OrangeHRM Website
    [Documentation]    Opens orangeHRM.com website with selenium configuration.
    Set Selenium Timeout    ${DEFAULT_TIMEOUT}
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
