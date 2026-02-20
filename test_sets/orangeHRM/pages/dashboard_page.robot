*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${DASHBOARD_TITLE}            Dashboard
${DASHBOARD_WIDGET_TITLES}    css=div.orangehrm-dashboard-widget div.orangehrm-dashboard-widget-header div.orangehrm-dashboard-widget-name p.oxd-text.oxd-text--p
@{EXPECTED_WIDGET_TITLES}    Time at Work    My Actions    Quick Launch    Buzz Latest Posts
...    Employees on Leave Today    Employee Distribution by Sub Unit    Employee Distribution by Location

*** Keywords ***
Check Dashboard Widgets
    [Documentation]    Checks all required title's widget on dashboard page.
    Wait Until Element Is Visible    ${DASHBOARD_WIDGET_TITLES}
    FOR    ${title}    IN    @{EXPECTED_WIDGET_TITLES}
        Page Should Contain    ${title}
    END
