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
    [Documentation]    Checks that Writes and reads a file on MicroPython filesystem works correctly.
    Execute command in MicroPython    with open("test.txt", "w") as f: f.write("Test data")${ENTER}
    ${response}    Execute command in MicroPython    with open("test.txt", "r") as f: print(f.read())${ENTER}
    Should Contain    ${response}    Test data

ES-03 Toggle LED
    [Documentation]    Chcecks that turns LED on and off on ESP32 with MicroPython works correctly.
    Execute command in MicroPython    from machine import Pin; led = Pin(2, Pin.OUT); led.value(1)
    ${response}    Execute command in MicroPython    print(led.value())
    Should Be Equal    ${response}    1
    Execute command in MicroPython    led.value(0)
    ${response}    Execute command in MicroPython    print(led.value())
    Should Be Equal    ${response}    0

ES-04 List Files
    [Documentation]    Check that lists files available on the MicroPython device works correctly.
    Execute command in MicroPython    with open("list_files.txt", "w") as f: f.write("List Files")${ENTER}
    ${response}    Execute command in MicroPython    import os; print(os.listdir())
    Should Contain    ${response}    list_files.txt
    Execute command in MicroPython    os.remove("list_files.txt")
    ${response}    Execute command in MicroPython    print(os.listdir())
    Should Not Contain    ${response}    list_files.txt

ES-05 Read TouchPad Value
    [Documentation]    Checks that on the MicroPython is possible to read value from a capacitive
    ...                touch pin.
    Execute command in MicroPython    from machine import TouchPad; touch = TouchPad(Pin(4))
    ${response}    Execute command in MicroPython    print(touch.read())
    Should Match Regexp    ${response}    ^[0-9]+$

ES-06 Read NVS Storage
    [Documentation]    Checks that on ESP32 with MicroPython is possbile to read a stored value from
    ...                NVS (Non-Volatile Storage).
    ${response}    Execute command in MicroPython    import esp32; print(esp32.NVS)
    Should Not Be Empty    ${response}

ES-07 Check MicroPython Version
    [Documentation]    Checks that that the MicroPython version on ESP is correct.
    ${response}    Execute command in MicroPython    print(os.uname())
    Should Contain    ${response}    esp32
    Should Contain    ${response}    ${MICROPYTHON_VERSION}
