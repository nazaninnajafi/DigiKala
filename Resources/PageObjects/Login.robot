*** Settings ***
Library     SeleniumLibrary


*** Variables ***
${WebsiteName}                 فروشگاه اینترنتی دیجی‌کالا                                   
${ClickOnLogin}                 xpath://*[contains(text(),'ورود')]
${UsernameInput}                xpath://input[@name="username"]
#xpath://input[@name="username"]
${Username}                     najafi.nazanin@gmail.com
${UsernamePressKeys}            xpath://button[@data-cro-id="login-register"]
#xpath://button[@type="submit"]
#//*[@id="__next"]/main/div[2]/form/button/div[2]
${PasswordInput}                xpath://input[@name="password"]
#//*[@id="__next"]/main/div[2]/form/label/div/div[1]/input
${Password}                     8349270
${PasswordPressKeys}            xpath://button[@type="submit"]
${ProfileButton}                xpath://div[contains(@class, "profileButton")]
${Profile}                      نازنین نجفی


*** Keywords ***
Verify Login Page Loaded
        wait until page contains   ${WebsiteName}

Click on login
        Click Element   ${ClickOnLogin}

Enter Username and Click
        Assertion Text  ورود
        Input Text      ${UsernameInput}  ${Username}
        Click Element      ${UsernamePressKeys}   

Enter Password and Click
        Assertion Text  تایید 
        Wait Until Element Is Enabled   ${PasswordInput} 
        Input Password      ${PasswordInput}   ${Password}
        Click Element      ${PasswordPressKeys}
     
Check Username on Page
        Wait Until Element Is Visible   ${ProfileButton} 
        Click Element   ${ProfileButton}
        Assertion Text  ${Profile}
     
        
                