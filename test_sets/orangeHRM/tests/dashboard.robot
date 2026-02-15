*** Settings ***
Resource            ../resources/keywords.robot
Resource            ../components/nav_bar_component.robot

Test Setup          Run Keywords    Open OrangeHRM Website
...                 AND    Login To OrangeHRM Website
Test Teardown       Close Browser

*** Test Cases ***
