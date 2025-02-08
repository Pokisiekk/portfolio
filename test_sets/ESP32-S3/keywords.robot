*** Settings ***
Library         Collections
Library         String
Library         Process
Resource        variables.robot
Library         SerialLibrary    ${PORT}    baudrate=${BAUDRATE}    encoding=${ENCODING}

*** Keywords ***
Connect to MicroPython
    [Documentation]    Connects with MicroPython via serial.
    Port Should Be Open
    Reset Input Buffer
    Write Data    ${ENTER}
    Read Until    ${PROMPT}

Execute command in MicroPython
    [Documentation]    Executes a given command in Micropython and returns its response.
    [Arguments]    ${command}
    Write Data    ${command}
    Write Data    ${ENTER}
    ${output}    Read Until    ${PROMPT}
    ${response}    Get Command Output    ${output}
    RETURN    ${response}

Get Command Output
    [Documentation]    Returns the command response from the entire output.
    [Arguments]    ${output}
    ${lines}    Split To Lines    ${output}
    @{filtered_lines}    Get Slice From List    ${lines}    1    -1
    ${response}    Catenate    SEPARATOR=\n    @{filtered_lines}
    RETURN    ${response}

Check Wifi Connection
    [Documentation]    Checks that the network connection has been set correctly.
    ${output}    Execute command in MicroPython    print(wlan.isconnected())
    Should Be Equal    ${output}    True

Setup Wifi Connection
    [Documentation]    Sets up the wifi connection on ESP with Micorpython.
    Execute command in MicroPython    import network; import time
    Execute command in MicroPython    wlan = network.WLAN(network.STA_IF); wlan.active(True)
    Execute command in MicroPython    wlan.connect('${WIFI_NAME}', '${WIFI_PASSWORD}')
    Wait Until Keyword Succeeds    15s    1s    Check Wifi Connection
