*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}          https://www.digikala.com/ 
${browser}      Chrome 
${Speed}        0s
${Timeout}      60s

*** Keywords ***
Open Page
        [documentation]  This Is Open Digikala
        Set Selenium Speed  ${Speed}
        Set Selenium Timeout  ${Timeout}
        Open Browser  ${url}  ${browser}
        Maximize Browser Window
        
Close Page
        Close Browser

Click 
        [Arguments]     ${arg}
        Wait Until Element Is Enabled   ${arg}
        Run Keyword And Ignore Error  Scroll Element Into View  ${arg}
        Wait Until Element Is Visible   ${arg}
        Run Keyword And Ignore Error  Mouse Over    ${arg}
        Wait Until Keyword Succeeds  2 min    5 sec  Click Element   ${arg}    

Assertion Text
        [Arguments]     ${text}
        wait until page contains   ${text} 
        Page Should Contain     ${text}

Add Filter
        [Arguments]     ${assertionText}       ${filter}       ${subFilter}
        Assertion Text  ${assertionText}  
        Run Keyword And Ignore Error  Scroll Element Into View   ${filter} 
        Wait Until Element Is Visible   ${filter}
        Wait Until Keyword Succeeds  2 min    5 sec  Click Element   ${filter}
        Wait Until Element Is Enabled   ${subFilter}
        Run Keyword And Ignore Error  Scroll Element Into View  ${subFilter}
        Mouse Over  ${subFilter}    
        Wait Until Keyword Succeeds  2 min    5 sec  Click Element   ${subFilter}

Find and Select Product  
        [Arguments]     ${select_product}
        Wait Until Element Is Enabled    ${select_product}
        Run Keyword And Ignore Error  Scroll Element Into View   ${select_product}
        Mouse Over   ${select_product}
        Wait Until Keyword Succeeds  2 min    5 sec  Click Element   ${select_product} 
        ${handle}  Get Window Handles
        Switch Window  NEW

Open DigiKala And Login  
        Open Page
        Verify Login Page Loaded
        Click on login
        Enter Username and Click
        Enter Password and Click