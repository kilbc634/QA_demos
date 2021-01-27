*** Settings ***
Variables       setting.py
Resource        libraries.robot

Suite Setup    SuiteSetup
Suite Teardown    Close All Browsers

*** Test Cases ***
Add To Cart Should Succeed
    [Tags]    cart_A
    Go To    ${TOP_PAGE}
    Click Product Image Of Featured Products
    Wait Until Element Is Visible    //div[@class="product-wrap"]/h1[@class="product-title"]
    ${productName} =    Get Text    //div[@class="product-wrap"]/h1[@class="product-title"]
    Add Product To Cart On Product Page
    Go To    ${CART_PAGE}
    Verify Specific Product Should Exists In Shopping Cart    ${productName}
    [Teardown]    Run Keyword If Test Passed    Remove All Shopping Cart Items

*** Keywords ***
SuiteSetup
    Open Chrome With Webdriver    ${CART_PAGE}
