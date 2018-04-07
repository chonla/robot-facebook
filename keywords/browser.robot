*** Variables ***
@{CHROME_OPTIONS}    disable-notifications

*** Keywords ***
Open Chrome Browser
    [Arguments]    ${url}
    ${options}=    Set Chrome Options
    Create WebDriver    Chrome    chrome_options=${options} 
    Go To    ${url}

Set Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    : FOR    ${option}    IN    @{CHROME_OPTIONS}
    \    Call Method    ${options}    add_argument    ${option}
    [Return]    ${options}