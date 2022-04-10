*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}  https://www.digikala.com/ 
${browser}  Chrome 
${Speed}  0s
${Timeout}  120s

*** Keywords ***
Open Page
        [documentation]  This is test to Login digikala
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
        Mouse Over    ${arg}
        Wait Until Keyword Succeeds  2 min    5 sec  Click Element   ${arg}    

assertion Text
        [Arguments]     ${text}
        wait until page contains   ${text} 
        Page Should Contain     ${text}

Add Filter
        [Arguments]     ${assertion_text}       ${filter}       ${sub_filter}
        assertion Text  ${assertion_text}  
        Run Keyword And Ignore Error  Scroll Element Into View   ${filter} 
        Wait Until Element Is Visible   ${filter}
        Wait Until Keyword Succeeds  2 min    5 sec  Click Element   ${filter}
        Wait Until Element Is Enabled   ${sub_filter}
        Run Keyword And Ignore Error  Scroll Element Into View  ${sub_filter}
        Mouse Over  ${sub_filter}    
        Wait Until Keyword Succeeds  2 min    5 sec  Click Element   ${sub_filter}

Find and Select Product  
        [Arguments]     ${select_product}
        Wait Until Element Is Enabled    ${select_product}
        Run Keyword And Ignore Error  Scroll Element Into View   ${select_product}
        Mouse Over   ${select_product}
        Wait Until Keyword Succeeds  2 min    5 sec  Click Element   ${select_product} 
        ${handle}  Get Window Handles
        Switch Window  NEW