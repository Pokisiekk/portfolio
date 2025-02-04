*** Settings ***
Library         Collections
Library         String
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
