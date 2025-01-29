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

RA-02 Single User
    [Documentation]    Checks that the requres API returns user request data.
    ${response}    GET On Session    ${SESSION}    ${USER_2}
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()}    data
    Should Be Equal As Strings    ${response.json()}[data][first_name]    Janet
    Should Be Equal As Strings    ${response.json()}[data][last_name]    Weaver

RA-03 Single User Not Found
    [Documentation]    Checks that the requres API returns the correct error
    ...    code for a non-existent user.
    ${response}    GET On Session    ${SESSION}    /users/48
    Status Should Be    404    ${response}