*** Settings ***
Resource            keywords.robot

Test Setup          Open Luma Website
Test Teardown       Close Browser

*** Test Cases ***
LU-01 Add One Item To Cart
    [DOcumentation]    Checks that adding one item to the cart works correctly.    
    Click    role=menuitem[name="What's New"]
    Click    role=link[name="Hoodies & Sweatshirts"] >> nth=0
    
    Click    role=listitem >> text=Circe Hooded Ice Fleece As >> role=radio[name="S"]
    Click    role=listitem >> text=Circe Hooded Ice Fleece As >> role=radio[name="Green"]
    Click    role=listitem >> text=Circe Hooded Ice Fleece As >> role=button

    Click    role=link[name=" My Cart 1 1 items"]
    Click    role=button[name="Proceed to Checkout"]

    Click    role=tab[name="Item in Cart "]
    Click    role=tab[name="View Details "]
    
    Get Text    role=textbox[name="Size"]    ==    S
    Get Text    role=textbox[name="Color"]    ==    Green
