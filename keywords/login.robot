*** Keywords ***
Login With
    [Arguments]    ${email}    ${password}
    Input Text    email    ${email}
    Input Password    pass    ${password}
    Click Button     xpath://*[@id="loginbutton"]/input
    Wait Until Element Is Visible    feedx_sprouts_container