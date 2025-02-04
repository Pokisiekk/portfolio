*** Settings ***
Resource            ../keywords.robot
Resource            ../variables.robot

Suite Setup         Connect to MicroPython
Suite Teardown      Close Port

*** Test Cases ***
ES-01 Hello world
    [Documentation]    Checks that MicroPython on ESP32 correctly displays "Hello world!".
    ${response}    Execute command in MicroPython    print("Hello World!")
    Should Contain    ${response}    Hello World!

ES-02 Write and Read File
    [Documentation]    Writes and reads a file on MicroPython filesystem.
    Execute command in MicroPython    with open("test.txt", "w") as f: f.write("Test data")\x0D\x0A
    ${response}    Execute command in MicroPython    with open("test.txt", "r") as f: print(f.read())\x0D\x0A
    Should Contain    ${response}    Test data
