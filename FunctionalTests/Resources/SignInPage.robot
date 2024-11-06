*** Settings ***
Library     SeleniumLibrary
Variables   ../Locators/HeaderLocators.py
Variables   ../Locators/SignInPageLocators.py
Variables   ../Utils/TestConfigData.py

*** Keywords ***
Login user with email and password
    [Arguments]     ${username}     ${password}
    User enters username and password    ${username}    ${password}
    Click sign in button

User enters username and password
    [Arguments]     ${username}     ${password}
    Wait Until Element Is Enabled    ${SignInWithEmailOptionButton}     ${Timeout}
    Click Element    ${SignInWithEmailOptionButton}
    Wait Until Element Is Enabled    ${EmailInputField}     ${Timeout}
    Input Text    ${EmailInputField}    ${username}
    Input Text    ${PasswordInputField}    ${password}

Click sign in button
    Wait Until Element Is Enabled    ${SignInButton}    ${Timeout}
    Click Element    ${SignInButton}
