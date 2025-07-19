*** Settings ***
Library         Browser

*** Variables ***
${FIRST_MUSIC}               css=a.yt-lockup-view-model-wiz__content-image >> nth=0

*** Keywords ***
Select First Music
    [Documentation]    Selects the first music on the page.
    Wait For Elements State    ${FIRST_MUSIC}    visible
    Click    ${FIRST_MUSIC}
