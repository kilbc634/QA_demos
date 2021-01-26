*** Keywords ***
Verify String Should Be Expected
    [Arguments]    ${string}    ${expected}
    Should Be Equal    ${string}    ${expected}

Verify Element Should Be Exists
    [Arguments]    ${element}
    Wait Until Page Contains Element    ${element}
    Wait Until Element Is Visible    ${element}
    Element Should Be Visible    ${element}
