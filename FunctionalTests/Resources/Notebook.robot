*** Settings ***
Library     SeleniumLibrary
Variables   ../Locators/HeaderLocators.py
Variables   ../Locators/Code.py
Variables   ../Utils/TestConfigData.py

*** Keywords ***
Click on code from sidebar
    Wait Until Element Is Enabled    ${Code}    ${Timeout}
    Sleep    1
    Click Element    ${Code}
    Sleep    3

Retry Click Until Element is Visible
    [Arguments]     ${retry_interval}=3s
    Wait Until Keyword Succeeds     ${Timeout}   ${retry_interval}    Element Should Be Visible After Click

Element Should Be Visible After Click
    Wait Until Element Is Enabled    ${AddNotebooksButton}      ${Timeout}
    Click Element    ${AddNotebooksButton}
    Sleep    3
    Element Should Be Visible    ${ExpectedElement}



