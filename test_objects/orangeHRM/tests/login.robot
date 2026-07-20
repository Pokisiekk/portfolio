*** Settings ***
Resource            ../resources/keywords.robot
Resource            ../pages/login_page.robot

Test Setup          Open OrangeHRM Website
Test Teardown       Close Browser

*** Test Cases ***
LO-01 Successful Login
    [Documentation]    Checks that login with valid username and password works.
    Login To OrangeHRM Website

LO-02 Unsuccessful Login With Invalid Username
    [Documentation]    Checks that login with invalid username will end in failure.
    Login With Invalid Username

LO-03 Unsuccessful Login With Invalid Password
    [Documentation]    Checks that login with invalid password will end in failure.
    Login With Invalid Password
