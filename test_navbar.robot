*** Settings ***
Variables       setting.py
Resource        libraries.robot

Suite Setup    SuiteSetup
Suite Teardown    Close All Browsers

*** Test Cases ***
Click Navigation Logo Should Go To Top Page
    [Tags]    navbar_A
    Wait Until Element Is Visible    //div[@class="header2020-inner"]/div[@class="header2020-logo"]//img
    ${url} =    Get Element Attribute    //div[@class="header2020-inner"]/div[@class="header2020-logo"]/a    href
    Verify String Should Be Expected    ${url}    ${TOP_PAGE}
    Click Element    //div[@class="header2020-inner"]/div[@class="header2020-logo"]//img
    Sleep    3
    Verify Should Navigate To Top Page

*** Keywords ***
SuiteSetup
    Open Chrome With Webdriver    ${TOP_PAGE}
    Close Subscribe Popup If Need
