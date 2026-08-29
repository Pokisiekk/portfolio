*** Settings ***
Library         SeleniumLibrary
Resource        ../resources/variables.robot

*** Variables ***
${DASHBOARD_TITLE}            Dashboard
${DASHBOARD_WIDGET_TITLES}    css=div.orangehrm-dashboard-widget div.orangehrm-dashboard-widget-header div.orangehrm-dashboard-widget-name p.oxd-text.oxd-text--p
@{EXPECTED_WIDGET_TITLES}     Time at Work    My Actions    Quick Launch    Buzz Latest Posts
...    Employees on Leave Today    Employee Distribution by Sub Unit    Employee Distribution by Location

${LEAVE_WIDGET}               css=i.orangehrm-leave-card-icon.bi-gear-fill
${WIDGET_SWITCH}              css=span.oxd-switch-input.oxd-switch-input--active
${SAVE_BUTTON}                css=button.oxd-button.oxd-button--secondary.orangehrm-left-space[type="submit"]
${LABEL_SUCCESS}              css=div.oxd-toast.oxd-toast--success
${LABEL_SUCCESS_TITLE}        css=div.oxd-toast.oxd-toast--success p.oxd-text--toast-title
${LABEL_SUCCESS_MESSAGE}      css=div.oxd-toast.oxd-toast--success p.oxd-text--toast-message
${FORM_LOADER}                css=div.oxd-form-loader

*** Keywords ***
Check Dashboard Widgets
    [Documentation]    Checks all required title's widget on dashboard page.
    Wait Until Element Is Visible    ${DASHBOARD_WIDGET_TITLES}
    FOR    ${title}    IN    @{EXPECTED_WIDGET_TITLES}
        Page Should Contain    ${title}
    END

Toggle Dashboard Widget And Save
    [Documentation]    Toggle the Employees on Leave visiability option.
    Wait Until Element Is Visible    ${LEAVE_WIDGET}
    Click Element    ${LEAVE_WIDGET}
    Wait Until Element Is Visible    ${WIDGET_SWITCH}
    Wait Until Element Is Not Visible    ${FORM_LOADER}
    Click Element    ${WIDGET_SWITCH}
    Wait Until Element Is Enabled    ${SAVE_BUTTON}
    Click Button    ${SAVE_BUTTON}

Verify Success Label
    [Documentation]    Checks the content of the success label.
    Wait Until Element Is Visible    ${LABEL_SUCCESS}
    Element Text Should Be    ${LABEL_SUCCESS_TITLE}      Success
    Element Should Contain    ${LABEL_SUCCESS_MESSAGE}    Successfully Updated
