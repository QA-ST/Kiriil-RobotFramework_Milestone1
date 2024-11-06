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
Variables   ../TestData/DataSetsTestData.py

Suite Setup     Setup browser context and Navigate to the web app    ${AppUrl}    ${ChromeBrowser}

*** Variables ***
${csvFilePath}
${dataFetchedFromTable}     []

*** Test Cases ***
Download CSV file and verify content from UI
    Click sign in button from header
    Login user with email and password    ${UserEmail}    ${UserPassword}
    Select CSV file from data explorer section    ${DataExplorerCsvFileToDownload}
    Click the data explorer file download icon
    ${dataFetchedFromTable}     Fetch data for circuit from data explorer table    ${TargetCircuitToFetchFromCsv}
    Get CSV file path
    ${dataFtechedFromCscFileDownloaded}    Fetch Row From Csv    ${csvFilePath}    ${TargetCircuitToFetchFromCsv}
    Log    ${dataFetchedFromTable}
    Log    ${dataFtechedFromCscFileDownloaded}
    Should Be Equal    ${dataFetchedFromTable}    ${dataFtechedFromCscFileDownloaded}

*** Keywords ***
Get CSV file path
    ${projectRootDirectory}  HelperMethods.Project Root Directory
    ${filePath}     Catenate    ${projectRootDirectory}${DefaultDownloadDirectory}${DataExplorerCsvFilePath}
    VAR     ${csvFilePath}      ${filePath}      scope=SUITE