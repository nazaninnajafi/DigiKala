*** Settings ***

Library     SeleniumLibrary


*** Variables ***

${Website_name}                 فروشگاه اینترنتی دیجی‌کالا                                   
${click_on_login}               xpath://*[contains(text(),'ورود')]
${Username_box}                 xpath://input[@name="username"]
${Username}                     najafi.nazanin@gmail.com
${Username_Press_keys}          xpath://button[@data-cro-id="login-register"]
#xpath://button[@type="submit"]
#//*[@id="__next"]/main/div[2]/form/button/div[2]
${Password_box}                 xpath://input[@name="password"]
#//*[@id="__next"]/main/div[2]/form/label/div/div[1]/input
${Password}                     8349270
${Password_Press_keys}          xpath://button[@type="submit"]
${Profile_button}               xpath://div[contains(@class, "profileButton")]
${Profile_name}                 نازنین نجفی



*** Keywords ***
Verify Login Page Loaded
        wait until page contains   ${Website_name}
        
click on login
        Click Element   ${click_on_login}

Enter Username and Click
        assertion Text  ورود
        #wait until page contains  ورود
        Input Text      ${Username_box}  ${Username}
        Click Element      ${Username_Press_keys}
        #//*[contains(text(),'ورود')]
        #${Username_Press_keys}   

Enter Password and Click
        assertion Text  تایید
        #wait until page contains  تایید 
        Wait Until Element Is Enabled   ${Password_box} 
        Input Password      ${Password_box}  ${Password}
        Click Element      ${Password_Press_keys}
        #//*[contains(text(),'تایید')]
          
        
Check Username on Page
        Wait Until Element Is Visible   ${Profile_button} 
        Click Element   ${Profile_button}
        #wait until page contains   ${Profile_name}
        assertion Text  ${Profile_name}
        #Click Element      ${Profile_name}       
        
                