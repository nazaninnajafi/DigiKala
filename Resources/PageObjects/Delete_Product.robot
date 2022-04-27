*** Settings ***
Library  SeleniumLibrary

Resource  ../commonfunctionality.robot

*** Variables ***
${Delet}    //*[@id="__next"]/div[1]/div[3]/div[3]/div[2]/div/ul[2]/li/div/div/section/div/div/div[2]/div[2]/div[1]/div[3]/div/button[2]
${Product_on_page}    xpath://div[@class="overflow-hidden"]/dive[1]
${Page Should Not Contain}   Page Should Not Contain  سبد خرید شما خالی است!


*** Keywords ***
Add Product
    Click   xpath://a[@href="/best-selling/"]   
    Find and Select Product    ${Productt}
    Click   ${AddToCart}
    Click   ${cartButton}

Remove Product 
    Wait Until Element Is Visible   xpath://*[contains(text(),'سبد خرید شما')]
    Wait Until Element Is Enabled   ${Delet}
    Run Keyword And Ignore Error  Scroll Element Into View   ${Delet}
    Wait Until Element Is Visible   ${Delet}
    Wait Until Keyword Succeeds  2 min    5 sec  Click Element   ${Delet}






#${Delet}  xpath://div[class="d-flex flex-column ai-center"]//button[@data-cro-id="cart-delete-item-right"]
# xpath://button[@data-cro-id="cart-delete-item-right"]
# ${your_cart}    xpath://*[@class="overflow-hidden"]
# ${Product_on_page}    xpath://div[@class="overflow-hidden"]/dive[1]

# Remove Products
#     FOR     ${Element}  IN  ${Product_on_page}
#         Log To Console  ${Element}
#         Remove Product
#     END

Remove Products
    FOR    ${i}    IN RANGE    10
        ${Page Should Not Contain}   Page Should Not Contain  سبد خرید شما خالی است!
        Run Keyword If    '${Page Should Not Contain}' == 'PASS'   Remove Product 
    END

    # ${Page Should Not Contain}   Page Should Not Contain  سبد خرید شما خالی است!
    # Run Keyword If    '${Page Should Not Contain}' == 'PASS'   Remove Product 

    # @{Product_on_page}     Get List Items   ${your_cart}
    # FOR     ${Element}  IN  @{Product_on_page}
    #         Remove Product
    # END
    
    
   
