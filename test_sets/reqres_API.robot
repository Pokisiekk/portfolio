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
    ${response}    GET On Session    ${SESSION}    /users/48    expected_status=any
    Status Should Be    404    ${response}

RA-04 Create User
    [Documentation]    Checks that a user can be added via the requres API.
    ${body}    Create Dictionary    name=Kamil    job=Tester
    ${response}    POST On Session    ${SESSION}    /users    json=${body}
    Status Should Be    201    ${response}
    Dictionary Should Contain Key    ${response.json()}    id
    Dictionary Should Contain Key    ${response.json()}    createdAt

RA-05 Update User - PUT
    [Documentation]    Checks that a user's data can be fully updated via the
    ...    reqres API.
    ${body}    Create Dictionary    name=Kamil    job=Tester
    ${response}    PUT On Session    ${SESSION}    /users/2    json=${body}
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()}    updatedAt
    Should Be Equal As Strings    ${response.json()}[name]    Kamil
    Should Be Equal As Strings    ${response.json()}[job]    Tester

RA-06 Update User - PATCH
    [Documentation]    Checks that a user's data can be partially updated via
    ...    the reqres API.
    ${body}    Create Dictionary    job=Developer
    ${response}    PATCH On Session    ${SESSION}    /users/2    json=${body}
    Status Should Be    200    ${response}
    Dictionary Should Contain Key    ${response.json()}    updatedAt
    Should Be Equal As Strings    ${response.json()}[job]    Developer
