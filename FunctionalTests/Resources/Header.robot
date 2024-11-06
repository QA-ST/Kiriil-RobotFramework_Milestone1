*** Settings ***
Library     SeleniumLibrary
Variables   ../Locators/HeaderLocators.py
Variables   ../Utils/TestConfigData.py

*** Keywords ***
Click sign in button from header
    Wait Until Element Is Enabled    ${SignInButton}    ${Timeout}
    Click Element    ${SignInButton}