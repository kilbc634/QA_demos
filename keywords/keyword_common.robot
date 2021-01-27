*** Keywords ***
Go To Products Page
    [Arguments]    ${page}
    Open Sidebar
    Click Sidebar Products Category List Item By Name    ${page}

Verify String Should Be Expected
    [Arguments]    ${string}    ${expected}
    Should Be Equal    ${string}    ${expected}

Verify Element Should Be Exists
    [Arguments]    ${element}
    Wait Until Page Contains Element    ${element}
    Wait Until Element Is Visible    ${element}
    Element Should Be Visible    ${element}
