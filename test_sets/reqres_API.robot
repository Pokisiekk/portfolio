*** Settings ***
Resource            ../keywords.robot
Resource            ../variables.robot

Suite Setup         Setup Reqres API

*** Test Cases ***
RA-01 List Users
    [Documentation]    Checks that reqres API returns the list of users
    ...    correctly.
    ${response}    GET On Session   ${SESSION}    ${LIST_USERS}
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()}    data
