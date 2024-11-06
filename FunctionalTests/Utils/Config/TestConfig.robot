*** Settings ***
Library     SeleniumLibrary
Library     ../../../CommonUtilities/HelperMethods.py
Variables   ../EnvironmentVariables.py
Variables   ../TestConfigData.py

*** Keywords ***
Setup browser context and Navigate to the web app
    [Arguments]     ${webAppUrl}    ${browserName}
    ${projectRootDirectory}  HelperMethods.Project Root Directory
    ${defaultDownloadDirectory}     Catenate    ${projectRootDirectory}${DefaultDownloadDirectory}
    ${prefs} =    Create Dictionary    download.default_directory=${defaultDownloadDirectory}
    ${options}  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys
    Call Method  ${options}  add_argument  --user-agent\=${UserAgent}
    Call Method  ${options}  add_argument  --window-size\=1920,1080
#    Call Method  ${options}  add_argument  --headless
    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Open Browser    ${webAppUrl}    ${browserName}    options=${options}
    ${navigatedAppUrl}   Get Location
    Should Be Equal As Strings    ${navigatedAppUrl}    ${webAppUrl}