*** Keywords ***
Open Chrome With Webdriver
    [Arguments]    ${startPage}=${EMPTY}
    ${workDir} =    Evaluate    os.getcwd()    os
    ${options} =    Evaluate  sys.modules['selenium.webdriver.chrome.options'].Options()    sys
    Call Method     ${options}    add_argument    --disable-dev-shm-usage
    Call Method     ${options}    add_argument    --disable-notifications
    Call Method     ${options}    add_argument    --disable-gpu
    Run Keyword If    '${SHOW_BROWSER}' == 'false'    Run Keywords
    ...    Call Method     ${options}    add_argument    --no-sandbox    AND
    ...    Call Method     ${options}    add_argument    --headless
    ${myOS} =    Evaluate    platform.system()    platform
    ${chromedriverPath} =    Set Variable If
    ...    '${myOS}' == 'Windows'    ${workDir}/src/chromedriver_win.exe
    ...    '${myOS}' == 'Linux'    ${workDir}/src/chromedriver_linux
    ...    '${myOS}' == 'Darwin'    ${workDir}/src/chromedriver_mac
    ${driver} =    Create Webdriver    Chrome    options=${options}    executable_path=${chromedriverPath}
    Set Window Size    1440    900
    Run Keyword If    '${startPage}' != '${EMPTY}'
    ...    Go To     ${startPage}
