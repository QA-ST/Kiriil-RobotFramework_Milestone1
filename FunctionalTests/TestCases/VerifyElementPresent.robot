*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Library    String
Library    Collections
Resource    ../Utils/Config/TestConfig.robot
Resource    ../Resources/Header.robot
Resource    ../Resources/Notebook.robot
Resource    ../Resources/SignInPage.robot
Variables   ../Utils/EnvironmentVariables.py


Suite Setup     Setup browser context and Navigate to the web app    ${AppUrl}    ${ChromeBrowser}

*** Test Cases ***
Retry click on an element until the visibility of next element
    Click sign in button from header
    Login user with email and password    ${UserEmail}    ${UserPassword}
    Click on code from sidebar
    Retry Click Until Element is Visible
