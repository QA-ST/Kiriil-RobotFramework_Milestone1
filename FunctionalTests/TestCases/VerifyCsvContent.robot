*** Settings ***
Library     SeleniumLibrary
Library    OperatingSystem
Library    String
Library    Collections
Resource    ../Utils/Config/TestConfig.robot
Resource    ../Resources/Header.robot
Resource    ../Resources/SignInPage.robot
Resource    ../Resources/DataSetsPage.robot
Resource    ../Resources/DataSetsPage.robot
Variables   ../Utils/EnvironmentVariables.py


Suite Setup     Setup browser context and Navigate to the web app    ${AppUrl}    ${ChromeBrowser}

*** Variables ***
${csvFilePath}
${dataFetchedFromTable}     []

*** Test Cases ***
Download CSV file and verify content from UI
    Click sign in button from header
    Login user with email and password    ${UserEmail}    ${UserPassword}
    Delete existing files from the folder
    Click the data explorer file download icon
    ${dataFetchedFromTable}     Fetch data for circuit from data explorer table
    Get CSV file path
    ${dataFtechedFromCscFileDownloaded}    fetch_second_column_from_csvfile    ${csvFilePath}
    Log    ${dataFetchedFromTable}
    Log    ${dataFtechedFromCscFileDownloaded}
    Should Be Equal    ${dataFetchedFromTable}    ${dataFtechedFromCscFileDownloaded}

*** Keywords ***
Get CSV file path
    ${projectRootDirectory}  HelperMethods.Project Root Directory
    ${files}=    List Files In Directory    ${projectRootDirectory}${DefaultDownloadDirectory}
    ${file}=    Get From List    ${files}    0
    Log    ${file}
    ${file_name}=    Set Variable    ${file}
    ${filePath}     Catenate    ${projectRootDirectory}${DefaultDownloadDirectory}${file_name}
    VAR     ${csvFilePath}      ${filePath}      scope=SUITE


Delete existing files from the folder
    ${projectRootDirectory}  HelperMethods.Project Root Directory
    ${files}=    List Files In Directory    ${projectRootDirectory}${DefaultDownloadDirectory}
    FOR    ${file}    IN    @{files}
        Remove File    ${projectRootDirectory}${DefaultDownloadDirectory}${file}
        Log    All files have been deleted.
    END
