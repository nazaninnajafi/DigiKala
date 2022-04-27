*** Settings ***
Documentation         DataDriven
Library               SeleniumLibrary

Resource              ../commonfunctionality.robot


*** Variables ***
${Classification}     xpath://span[@data-cro-id="header-main-menu"]
${productClass}       xpath://a[@href="/main/book-and-media/"]
${productSubClass}    xpath://a[@href="/search/category-publication/"]
${Magazine}           xpath://*[@id="__next"]/div[1]/div[3]/div[3]/div[1]/div[1]/div[2]/a[1]
${CoverType}          xpath://div[contains(@class, "text-subtitle-strong d-flex ai-center") and contains(text(),'نوع جلد')]
${CoverPaper}         xpath://div[contains(@class, "text-subtitle-strong") and contains(text(),'کاغذی')]
${Product}            xpath://div[@class='d-flex flex-wrap']/div[1]


*** Keywords ***
Sub Category
    [Arguments]     ${assertionTextt}  ${subCategory}  
    Assertion Text  ${assertionTextt}
    Click   ${subCategory}

Category
    [Arguments]     ${MagazineType}
    Sub Category  دسته‌بندی کالاها  ${Classification}
    Sub Category  کتاب، لوازم تحریر و هنر  ${productClass}
    Sub Category  خرید بر اساس دسته‌بندی  ${productSubClass}
    Sub Category  مجلات  ${Magazine}
    Sub Category  مجلات داخلی  ${MagazineType}
    Add Filter  نوع جلد  ${CoverType}  ${CoverPaper}
    Find and Select Product  ${Product}
    Assertion Text  ویژگی‌ها
    Page Should Contain     کاغذی
