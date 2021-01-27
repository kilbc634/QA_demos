*** Keywords ***
Remove All Shopping Cart Items
    Wait Until Element Is Visible    //div[@id="cart-top"]//button[text()=" Remove All"]
    Click Element    //div[@id="cart-top"]//button[text()=" Remove All"]
    Wait Until Element Is Visible    //div[contains(@class, "modal-dialog")]//button[text()="Yes, Remove all of them."]
    Click Element    //div[contains(@class, "modal-dialog")]//button[text()="Yes, Remove all of them."]
    Wait Until Page Contains    Oh...seems like the cart is empty...

Verify Specific Product Should Exists In Shopping Cart
    [Arguments]    ${productName}
    Wait Until Element Is Visible    //div[@class="item-container"]/div[@class="item-info"]/a[@class="item-title"]
    Element Text Should Be    //div[@class="item-container"]/div[@class="item-info"]/a[@class="item-title"]    ${productName}
