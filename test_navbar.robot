*** Settings ***
Variables       setting.py
Resource        libraries.robot

Suite Setup    SuiteSetup
Suite Teardown    Close All Browsers

*** Test Cases ***
Check Sidebar Products Category
    [Tags]    navbar_C
    [Setup]    Open Sidebar
    [Template]    Verify Sidebar Products Category List Item Should As Expected
    Computer Systems
    Components
    Electronics
    Gaming
    Networking
    Office Solutions
    Automotive & Industrial
    Home & Tools
    Health & Sports
    Apparel & Accessories
    Toys & Drones
    [Teardown]    Close Sidebar

Click Navigation Logo Should Go To Top Page
    [Tags]    navbar_A
    Wait Until Element Is Visible    //div[@class="header2020-inner"]/div[@class="header2020-logo"]//img
    ${url} =    Get Element Attribute    //div[@class="header2020-inner"]/div[@class="header2020-logo"]/a    href
    Verify String Should Be Expected    ${url}    ${TOP_PAGE}
    Click Element    //div[@class="header2020-inner"]/div[@class="header2020-logo"]//img
    Sleep    3
    Verify Should Navigate To Top Page

Click Navigation Logo On Products Page Should Go To Top Page
    [Tags]    navbar_B
    [Setup]    SetProductsPageList
    FOR    ${page}    IN    @{pages}
        Go To Products Page    ${page}
        Wait Until Element Is Visible    //div[@class="header2020-inner"]/div[@class="header2020-logo"]//img
        ${url} =    Get Element Attribute    //div[@class="header2020-inner"]/div[@class="header2020-logo"]/a    href
        Verify String Should Be Expected    ${url}    ${TOP_PAGE}
        Click Element    //div[@class="header2020-inner"]/div[@class="header2020-logo"]//img
        Verify Should Navigate To Top Page
    END

*** Keywords ***
SuiteSetup
    Open Chrome With Webdriver    ${TOP_PAGE}
    Close Subscribe Popup If Need

SetProductsPageList
    Set Test Variable    @{pages}    Computer Systems    Components    Electronics    Gaming    Networking    Office Solutions    Automotive & Industrial    Home & Tools    Health & Sports    Apparel & Accessories    Toys & Drones
