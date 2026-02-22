*** Settings ***
Resource            ../resources/keywords.robot
Resource            ../pages/dashboard_page.robot
Resource            ../pages/login_page.robot

Test Setup          Run Keywords    Open OrangeHRM Website
...                 AND    Login To OrangeHRM Website
Test Teardown       Close Browser

*** Test Cases ***
DO-01 Dashboard Verification
    [Documentation]    Checks that dashboard displays expected widgets.
    Check Dashboard Widgets

DO-02 Dashboard Configuration
    [Documentation]    Checks that simple action on dashboard is possible.
    Toggle Dashboard Widget And Save
    Verify Success Label
