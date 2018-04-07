*** Settings ***
Library    SeleniumLibrary
Resource    keywords/browser.robot
Resource    keywords/login.robot

*** Variables ***
${MESSAGE}    ทดสอบโพสต์ข้อความจาก Robot Framework #AutomatedPostFromRobotFramework
${FACEBOOK_EMAIL}    someemail@address.com
${FACEBOOK_PASSWORD}     facebookpassword

*** Test Cases ***
Post Something To Facebook
    Open Chrome Browser    https://www.facebook.com
    Login With    ${FACEBOOK_EMAIL}    ${FACEBOOK_PASSWORD}
    Go To My Profile Page
    Activate Post Textbox
    Post Message    ${MESSAGE}
    Message Should Be Posted    ${MESSAGE}
    [Teardown]    Close Browser

*** Keywords ***
Go To My Profile Page
    Click Link    xpath://*[@data-click="profile_icon"]/a
    Wait Until Element Is Visible    timeline_composer_container

Activate Post Textbox
    Click Element    timeline_composer_container

Post Message
    [Arguments]    ${msg}
    Press Key    xpath=//*[@data-testid="status-attachment-mentions-input"]    ${msg}
    Click Button    xpath://*[@id="timeline_composer_container"]//button[@type="submit"]
    Wait Until Element Is Enabled    xpath://*[@id="timeline_composer_container"]//button[@type="submit"]

Message Should Be Posted
    [Arguments]    ${msg}
    Wait Until Element Contains    xpath://*[starts-with(@id, "tl_unit_")]    ${msg}