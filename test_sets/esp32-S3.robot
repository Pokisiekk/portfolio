*** Settings ***
Resource            ../keywords.robot
Resource            ../variables.robot

Suite Setup         Connect to MicroPython

*** Test Cases ***
ES-01 Hello world
    [Documentation]    Checks that MicroPython on ESP32 correctly displays "Hello world!".
    ${response}    Execute command in MicroPython    print("Hello World!")
    Should Contain    ${response}    Hello World!
    Close Port
