*** Settings ***
Library             SeleniumLibrary
    
*** Variables ***
${DIRECTORY_TAB}         css:a[href$="/web/index.php/directory/viewDirectory"]
${ADMIN_TAB}             css:a[href$="/web/index.php/admin/viewAdminModule"]
${TIME_TAB}              css:a[href$="/web/index.php/time/viewTimeModule"]

*** Keywords ***
Select Directory From Nav Bar
    [Documentation]    Selects "Directory" from navigation bar.
    Click Element    ${DIRECTORY_TAB}

Select Admin From Nav Bar
    [Documentation]    Selects "Admin" from navigation bar.
    Click Element    ${ADMIN_TAB}

Select Time From Nav Bar
    [Documentation]    Selects "Time" from navigation bar.
    Click Element    ${TIME_TAB} 
