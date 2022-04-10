*** Settings ***
Library  SeleniumLibrary

Resource  ../commonfunctionality.robot

*** Variables ***
#Category
${Classification}       xpath://span[@data-cro-id="header-main-menu"]
${product_class}        xpath://a[@href="/main/electronic-devices/"]
${product_sub_class}    xpath://a[@href="/search/category-mobile-phone/"]
#Filter
${Brand}                xpath://div[contains(@class, "text-subtitle-strong d-flex ai-center") and contains(text(),'برند')]
${Brand_name}           xpath://div[contains(@class, "text-subtitle-strong") and contains(text(),'اپل')]
${Seller_type}          xpath://div[contains(@class, "text-subtitle-strong d-flex ai-center") and contains(text(),'نوع فروشنده')]
${Seller_name}          xpath://div[contains(@class, "text-subtitle-strong") and contains(text(),'دیجی‌کالا')]
#Sort
${Best_selling}         xpath://div[contains(@data-cro-id, "plp-sort-option") and contains(text(),'پرفروش‌ترین‌')]
${Productt}             xpath://div[@class='d-flex flex-wrap']/div[3]
#cart
${Add_to_Cart}          xpath://button[@data-cro-id="pdp-add-to-cart"]
${cart_button}          xpath://a[@href="/checkout/cart/"]  
${Continue_Shopping}    xpath://div[contains(@class, "d-flex ai-center jc-center relative grow-1") and contains(text(),'ادامه')]
###xpath://a[@href="/checkout/shipping/"]


*** Keywords ***
Select Category
    wait until page contains  دسته‌بندی کالاها   
    Wait Until Element Is Visible   ${Classification}
    Click Element   ${Classification}
     
    wait until page contains    کالای دیجیتال     
    Mouse Over  ${product_class} 
    wait until page contains    گوشی موبایل    
    Wait Until Element Is Visible  ${product_sub_class}
    Mouse Over  ${product_sub_class}
    Click Element   ${product_sub_class}   

Filters
    Add Filter  برند  ${Brand}  ${Brand_name}
    Add Filter  نوع فروشنده  ${Seller_type}  ${Seller_name}

Cart
    #Add to Cart
    commonfunctionality.Click   ${Add_to_Cart}
    #Show Cart
    commonfunctionality.Click   ${cart_button}
    assertion Text  سبد خرید
    #Continue Shopping
    commonfunctionality.Click   ${Continue_Shopping}
    assertion Text  انتخاب زمان ارسال
    