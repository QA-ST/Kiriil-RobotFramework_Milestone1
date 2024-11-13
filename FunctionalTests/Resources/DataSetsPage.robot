*** Settings ***
Library     SeleniumLibrary
Library    Collections
Library    OperatingSystem
Variables   ../Locators/DataSetsPageLocators.py
Variables   ../Utils/TestConfigData.py

*** Keywords ***
# ---------- Data sets details page keywords ----------
Select CSV file from data explorer section
    [Arguments]     ${fileNameToDownload}
    Sleep    1
    ${dataExplorerFiles}    Get WebElements    ${DataExplorerFilesList}
    FOR    ${element}    IN    @{dataExplorerFiles}
        ${fileName}     Get Text    ${element}
        IF    '${fileName}' == '${fileNameToDownload}'
            Click Element    ${element}
            Sleep    2
            BREAK
        END
    END


Click the data explorer file download icon
    Wait Until Element Is Enabled    ${DataExplorerFileDownloadIcon}    ${Timeout}
    Sleep    1
    Scroll Element Into View    ${SummaryHeader}
    Click Element    ${DataExplorerFileDownloadIcon}
    Sleep    3

Fetch data for circuit from data explorer table
    ${data}     Create List
    ${count}    Set Variable    0
    Sleep    1
    ${circuits}     Get WebElements    ${CircuitsTableReferenceNameList}
    ${countone}       Get Length          ${circuits}
    Log             ${countone}
    FOR    ${element}    IN    @{circuits}
        ${count}    Evaluate    ${count} + 1
        ${referenceName}    Get Text    ${element}
        Append To List    ${data}   ${referenceName}

    END
    Log    ${data}
    RETURN    ${data}


