*** Settings ***
Library  SeleniumLibrary

Resource  ../commonfunctionality.robot

*** Variables ***
${Classification}       xpath://span[@data-cro-id="header-main-menu"]
${product_class}        xpath://a[@href="/main/book-and-media/"]
${product_sub_class}    xpath://a[@href="/search/category-publication/"]
#xpath://*[@id="__next"]/div[1]/div[3]/div[3]/div[1]/div[3]/div[2]/span[2]/a/p
${Magazine}             xpath://*[@id="__next"]/div[1]/div[3]/div[3]/div[1]/div[1]/div[2]/a[1]
#xpath://a[@href="/search/category-magazines/"]
${Cover_Type}           xpath://div[contains(@class, "text-subtitle-strong d-flex ai-center") and contains(text(),'نوع جلد')]
${Cover_Paper}          xpath://div[contains(@class, "text-subtitle-strong") and contains(text(),'کاغذی')]
${Product}              xpath://div[@class='d-flex flex-wrap']/div[1]

*** Keywords ***
Sub Category
    [Arguments]     ${assertion_textt}  ${sub_category}  
    assertion Text  ${assertion_textt}
    Click   ${sub_category}

Category
    [Arguments]     ${Magazine_Type}
    Sub Category  دسته‌بندی کالاها  ${Classification}
    Sub Category  کتاب، لوازم تحریر و هنر  ${product_class}
    Sub Category  خرید بر اساس دسته‌بندی  ${product_sub_class}
    Sub Category  مجلات  ${Magazine}
    Sub Category  مجلات داخلی  ${Magazine_Type}

    Add Filter  نوع جلد  ${Cover_Type}  ${Cover_Paper}

    Find and Select Product  ${Product}
    assertion Text  ویژگی‌ها
    Page Should Contain     کاغذی