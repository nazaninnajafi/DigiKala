*** Settings ***
Documentation   A Test to Login DigiKala
Library         SeleniumLibrary


*** Variables ***
${WebsiteName}                 فروشگاه اینترنتی دیجی‌کالا                                   
${ClickOnLogin}                xpath://*[contains(text(),'ورود')]
${UsernameInput}               xpath://input[@name="username"]
${Username}                    *******
${UsernamePressKeys}           xpath://button[@data-cro-id="login-register"]
${PasswordInput}               xpath://input[@name="password"]
${Password}                    *****
${PasswordPressKeys}           xpath://button[@type="submit"]
${ProfileButton}               xpath://div[contains(@class, "profileButton")]
${Profile}                     نازنین نجفی


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
     
        
                
