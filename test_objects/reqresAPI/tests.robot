*** Settings ***
Resource            keywords.robot

Suite Setup         Setup Reqres API

*** Test Cases ***
RA-01 List Users
    [Documentation]    Checks that reqres API returns the list of users correctly.
    ${response}    GET On Session   ${SESSION}    ${LIST_USERS}
    Status Should Be    200    ${response}
    Should Contain    ${response.json()}    data

RA-02 Single User
    [Documentation]    Checks that the requres API returns user request data.
    ${response}    GET On Session    ${SESSION}    ${USER_2}
    Status Should Be    200    ${response}
    Should Contain    ${response.json()}    data
    Should Be Equal As Strings    ${response.json()}[data][first_name]    Janet
    Should Be Equal As Strings    ${response.json()}[data][last_name]    Weaver

RA-03 Single User Not Found
    [Documentation]    Checks that the requres API returns the correct error code for a non-existent
    ...                user.
    ${response}    GET On Session    ${SESSION}    ${USER_48}    expected_status=any
    Status Should Be    404    ${response}

RA-04 Create User
    [Documentation]    Checks that a user can be added via the requres API.
    ${body}    Create Dictionary    name=Kamil    job=Tester
    ${response}    POST On Session    ${SESSION}    ${USERS}    json=${body}
    Status Should Be    201    ${response}
    Should Contain    ${response.json()}    id
    Should Contain    ${response.json()}    createdAt

RA-05 Update User - PUT
    [Documentation]    Checks that a user's data can be fully updated via the reqres API.
    ${body}    Create Dictionary    name=Kamil    job=Tester
    ${response}    PUT On Session    ${SESSION}    ${USER_2}    json=${body}
    Status Should Be    200    ${response}
    Should Contain    ${response.json()}    updatedAt
    Should Be Equal As Strings    ${response.json()}[name]    Kamil
    Should Be Equal As Strings    ${response.json()}[job]    Tester

RA-06 Update User - PATCH
    [Documentation]    Checks that a user's data can be partially updated via the reqres API.
    ${body}    Create Dictionary    job=Developer
    ${response}    PATCH On Session    ${SESSION}    ${USER_2}    json=${body}
    Status Should Be    200    ${response}
    Should Contain    ${response.json()}    updatedAt
    Should Be Equal As Strings    ${response.json()}[job]    Developer

RA-07 Delete User
    [Documentation]    Checks that a user can be deleted via the reqres API.
    ${response}    DELETE On Session    ${SESSION}    ${USER_2}    expected_status=any
    Status Should Be    204    ${response}

RA-08 Register User Successfully
    [Documentation]    Checks that a user can register successfully via the reqres API.
    ${response}    Post Request With Dictionary    ${REGISTER}    password=pistol
    Status Should Be    200    ${response}
    Should Be Equal As Integers    ${response.json()}[id]    4
    Should Be Equal As Strings    ${response.json()}[token]    ${TOKEN}

RA-09 Register User Unsuccessfully
    [Documentation]    Checks that registration via the reqres API fails when no password is
    ...                provided.
    ${response}    Post Request With Dictionary    ${REGISTER}
    Status Should Be    400    ${response}
    Should Contain    ${response.json()}    error

RA-10 Login User Successfully
    [Documentation]    Checks that a user can log in successfully via the
    ...    reqres API.
    ${response}    Post Request With Dictionary    ${LOGIN}    password=city
    Status Should Be    200    ${response}
    Should Be Equal As Strings    ${response.json()}[token]    ${TOKEN}

RA-11 Login User Unsuccessfully
    [Documentation]    Checks that login fails when no password is provided.
    ${response}    Post Request With Dictionary    ${LOGIN}
    Status Should Be    400    ${response}
    Should Contain    ${response.json()}    error
