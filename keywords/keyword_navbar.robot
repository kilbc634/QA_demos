*** Keywords ***
Click Navbar Morevert
    Wait Until Element Is Visible    //div[@class="header2020-inner"]/*[contains(@class, "menu-box")]/i[@aria-label="Site Menu"]
    Click Element    //div[@class="header2020-inner"]/*[contains(@class, "menu-box")]/i[@aria-label="Site Menu"]

Open Sidebar
    Wait Until Keyword Succeeds    3s    0.5s    Run Keywords
    ...    Click Navbar Morevert    AND
    ...    Wait Until Element Is Visible    //*[contains(@class, "menu-box") and contains(@class, "is-active")]/div[@class="menu-box-menu"]    timeout=0.5s

Close Sidebar
    Wait Until Keyword Succeeds    3s    0.5s    Run Keywords
    ...    Click Navbar Morevert    AND
    ...    Wait Until Element Is Not Visible    //*[contains(@class, "menu-box") and contains(@class, "is-active")]/div[@class="menu-box-menu"]    timeout=0.5s

Click Sidebar Products Category List Item By Name
    [Arguments]    ${name}
    ${targetElement} =    Set Variable    //*[contains(@class, "menu-box") and contains(@class, "is-active")]//div[@class="nav-list nav-level-2"]//li[@class="nav-level-3 menu-box"]/a[text()="${name}"]
    Wait Until Element Is Visible    ${targetElement}
    Click Element    ${targetElement}

Verify Sidebar Products Category List Item Should As Expected
    [Arguments]    ${name}
    ${targetElement} =    Set Variable    //*[contains(@class, "menu-box") and contains(@class, "is-active")]//div[@class="nav-list nav-level-2"]//li[@class="nav-level-3 menu-box"]/a[text()="${name}"]
    Verify Element Should Be Exists    ${targetElement}
