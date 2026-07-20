*** Settings ***
Resource            ../resources/keywords.robot
Resource            ../pages/directory_page.robot
Resource            ../pages/admin_page.robot
Resource            ../pages/time_page.robot
Resource            ../pages/login_page.robot
Resource            ../components/nav_bar_component.robot

Test Setup          Run Keywords    Open OrangeHRM Website
...                 AND    Login To OrangeHRM Website
Test Teardown       Close Browser

*** Test Cases ***
OH-01 Employee Search
    [Documentation]    Checks that employee seach in Directory tab on oragneHRM website works
    ...                correctly.
    Select Directory From Nav Bar
    Check Directory Page

OH-02 Admin Tab
    [Documentation]    Checks that searching for people by user role in Admin tab on oragneHRM
    ...                website works correctly.
    Select Admin From Nav Bar
    Check Admin Page

OH-03 Client Companies In Projects
    [Documentation]    Checks that client companies are added to the project information tab on
    ...                oragneHRM website.
    Select Time From Nav Bar
    Check Time Page
