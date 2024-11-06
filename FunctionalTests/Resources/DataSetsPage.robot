*** Settings ***
Library     SeleniumLibrary
Library    Collections
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
    [Arguments]     ${circuitName}
    ${data}     Create List
    ${count}    Set Variable    0
    Sleep    1
    ${circuits}     Get WebElements    ${CircuitsTableReferenceNameList}
    FOR    ${element}    IN    @{circuits}
        ${count}    Evaluate    ${count} + 1
        ${referenceName}    Get Text    ${element}
        IF    '${referenceName}' == '${circuitName}'
            ${totalCloumns}     Get Element Count    xpath=(//div/span[@class='sc-jcHdAB iJqDzd']/div)[${count}]/div
            FOR    ${counter}    IN RANGE    1    ${totalCloumns} + 1
                ${columnValue}  Get Text    xpath=((//div/span[@class='sc-jcHdAB iJqDzd']/div)[${count}]/div)[${counter}]
                Append To List  ${data}     ${columnValue}
            END
            BREAK
        END
    END
    Log    ${data}
    RETURN    ${data}
