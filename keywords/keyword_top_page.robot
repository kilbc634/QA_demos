*** Keywords ***
Click Product Image Of Featured Products
    [Arguments]    ${index}=1
    ${targetElement} =    Set Variable    //section[@class="page-section"][1]//div[contains(@class, "item-cells-wrap")]/*[@class="item-cell"][@id][${index}]//img
    Wait Until Element Is Visible    ${targetElement}
    Click Element    ${targetElement}

Close Subscribe Popup If Need
    [Arguments]    ${waitTime}=5s
    ${passed} =    Run Keyword And Return Status    Wait Until Element Is Visible    //div[@id="popup"]/a[@id="popup-close"]    timeout=${waitTime}
    Run Keyword If    ${passed}    Click Element    //div[@id="popup"]/a[@id="popup-close"]

Verify Should Navigate To Top Page
    Wait Until Location Is    ${TOP_PAGE}
    Verify Element Should Be Exists    //*[@class="page-content"]/*[@class="tiles-wrap"]//*[contains(@class, "grid-item")]/a[@class="tile-img"]/img
    Verify Element Should Be Exists    //section[@class="page-section"][1]//*[@class="standard-box-top-title"]
    Element Text Should Be    //section[@class="page-section"][1]//*[@class="standard-box-top-title"]    FEATURED PRODUCTS
