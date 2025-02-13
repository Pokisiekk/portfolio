*** Settings ***
Resource            keywords.robot

Test Setup          Open Luma Website
Test Teardown       Close Browser

*** Test Cases ***
LU-01 Add One Item To Cart
    [DOcumentation]    Checks that adding one item to the cart works correctly.    
    Click    id=${WHATS_NEW_ID}
    Click    css=a[href*="hoodies-and-sweatshirts-women"] >> nth=1
    Click    css=li.product-item:has-text("Circe Hooded Ice Fleece") div.swatch-option[id=${SIZE_S_ID}]
    Click    css=li.product-item:has-text("Circe Hooded Ice Fleece") div.swatch-option[id=${COLOR_GREEN_ID}]
    Click    css=li.product-item:has-text("Circe Hooded Ice Fleece") button.tocart
    Wait For Elements State    css=div[data-bind="html: $parent.prepareMessageForHtml(message.text)"]    visible    timeout=10s
    Click    css=a.action.showcart
    Click    id=${CHECKOUT_ID}
    Wait For Elements State    css=div.title[role="tab"]:has-text("Item in Cart")    visible    timeout=10s
    Click    css=div.title[role="tab"]:has-text("Item in Cart")
    Click    css=span[role="tab"]:has-text("View Details") 
    ${size}=    Get Text    css=dl.item-options dt:has-text("Size") + dd
    ${color}=    Get Text    css=dl.item-options dt:has-text("Color") + dd
    Should Be Equal    ${size}    S
    Should Be Equal    ${color}   Green
