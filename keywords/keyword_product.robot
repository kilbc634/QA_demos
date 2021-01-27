*** Keywords ***
Add Product To Cart On Product Page
    Click Add To Cart Button
    Wait Until Element Is Visible    //*[@id="modal-intermediary"]//div[@class="modal-header"]//*[@class="message-title"]
    Wait Until Element Contains    //*[@id="modal-intermediary"]//div[@class="modal-header"]//*[@class="message-title"]    ITEM HAS BEEN ADDED TO CART.

Click Add To Cart Button
    Wait Until Element Is Visible    //div[@id="ProductBuy"]//button[text()="Add to cart "]
    Click Element    //div[@id="ProductBuy"]//button[text()="Add to cart "]
