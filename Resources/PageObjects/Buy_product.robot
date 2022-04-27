*** Settings ***
Documentation          Buy Product
Library                SeleniumLibrary

Resource               ../commonfunctionality.robot

*** Variables ***
#Category
${Classification}      xpath://span[@data-cro-id="header-main-menu"]
${productClass}        xpath://a[@href="/main/electronic-devices/"]
${productSubClass}     xpath://a[@href="/search/category-mobile-phone/"]
#Filter
${Brand}               xpath://div[contains(@class, "text-subtitle-strong d-flex ai-center") and contains(text(),'برند')]
${BrandName}           xpath://div[contains(@class, "text-subtitle-strong") and contains(text(),'اپل')]
${SellerType}          xpath://div[contains(@class, "text-subtitle-strong d-flex ai-center") and contains(text(),'نوع فروشنده')]
${SellerName}          xpath://div[contains(@class, "text-subtitle-strong") and contains(text(),'دیجی‌کالا')]
#Sort
${BestSelling}         xpath://div[contains(@data-cro-id, "plp-sort-option") and contains(text(),'پرفروش‌ترین‌')]
${Productt}            xpath://div[@class='d-flex flex-wrap']/div[1]
${assertion}           xpath://*[@id="__next"]/div[1]/div[3]/div[3]/div[1]/article/div/div/h2
#cart
${AddToCart}           xpath://button[@data-cro-id="pdp-add-to-cart"]
${cartButton}          xpath://a[@href="/checkout/cart/"]  
${ContinueShopping}    xpath://div[contains(@class, "d-flex ai-center jc-center relative grow-1") and contains(text(),'ادامه')]



*** Keywords ***
Select Category
    wait until page contains  دسته‌بندی کالاها   
    Wait Until Element Is Visible   ${Classification}
    Click Element   ${Classification}
    wait until page contains    کالای دیجیتال     
    Mouse Over  ${productClass} 
    wait until page contains    گوشی موبایل    
    Wait Until Element Is Visible  ${productSubClass}
    Mouse Over  ${productSubClass}
    Click Element   ${productSubClass}   

Filters
    Add Filter  برند  ${Brand}  ${BrandName}
    Add Filter  نوع فروشنده  ${SellerType}  ${SellerName}

Find Product
    Click   ${BestSelling}
    # Run Keyword And Ignore Error  Scroll Element Into View  ${assertion}
    Find and Select Product   ${Productt}

Cart
    Click   ${AddToCart}
    Click   ${cartButton}
    Assertion Text  سبد خرید
    Click   ${ContinueShopping}
    Assertion Text  انتخاب زمان ارسال
    