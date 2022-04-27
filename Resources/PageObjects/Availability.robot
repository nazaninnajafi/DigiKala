*** Settings ***
Library  SeleniumLibrary
Resource  Buy_product.robot


*** Variables ***
${NextPage}     xpath://span[contains(text(),'بعدی')]
#xpath://span[contains(@class, "ml-2 text-body2-strong d-none d-inline-block-md") and contains(text(), "بعدی")]
${knowMe}        xpath://button[@data-cro-id="pdp-not-found-cta"]
${messege}        xpath://*[@id="modal-root"]/div[16]/div/div/div/div[2]/div/form/label[3]
#xpath://div[contains(@class,"Content--after-open")]//p[text()="سیستم پیام شخصی دیجیکالا"]
${submit}         xpath://div[contains(@class,"Content--after-open")]//div[text()="ثبت"]
#xpath://button[@type="submit"]
${assertion}      xpath://*[@id="__next"]/div[1]/div[3]/div[3]/div[1]/article/div/div/h2


*** Keywords ***
Next Page
  FOR    ${i}    IN RANGE    10
        Run Keyword And Ignore Error  Scroll Element Into View  ${assertion}     
  END
  Run Keyword And Ignore Error  Scroll Element Into View  ${assertion} 
  sleep  2s
  Set Focus To Element  ${NextPage}
  Wait Until Page Contains Element  ${NextPage}
  Click   ${NextPage}
   
Know Me 
    Assertion Text  ناموجود
    Click   ${knowMe}
    Assertion Text  اگر کالا موجود شد، چطور به شما اطلاع دهیم؟
    Click   ${messege}
    Assertion Text  ثبت
    Click   ${submit}
    Assertion Text  دیگر لازم نیست خبرم کنید


    

