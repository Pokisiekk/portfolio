*** Settings ***
Resource            ../resources/keywords.robot
Resource            ../pages/directory_page.robot
Resource            ../pages/admin_page.robot
Resource            ../pages/time_page.robot
Resource            ../components/nav_bar_component.robot

Test Setup          Open OrangeHRM Website
Test Teardown       Close Browser

*** Test Cases ***
LO-01 Succesfull login
    [Documentation]    Checks that login with valid username and password works.
    Login To OrangeHRM Website
