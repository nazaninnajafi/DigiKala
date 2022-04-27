*** Settings ***
Documentation   This Is Test To Check Availability Product
Library         SeleniumLibrary
Resource        Buy_product.robot


*** Variables ***
${NextPage}       xpath://span[contains(text(),'بعدی')]
${knowMe}         xpath://button[@data-cro-id="pdp-not-found-cta"]
${messege}        xpath://*[@id="modal-root"]/div[16]/div/div/div/div[2]/div/form/label[3]
${submit}         xpath://div[contains(@class,"Content--after-open")]//div[text()="ثبت"]
${assertion}      xpath://*[@id="__next"]/div[1]/div[3]/div[3]/div[1]/article/div/div/h2


*** Keywords ***
Next Page
  Set Focus To Element  ${NextPage}
  Wait Until Page Contains Element  ${NextPage}
  FOR    ${i}    IN RANGE    100
        Run Keyword And Ignore Error  Scroll Element Into View  ${assertion}     
  END
  Wait Until Element Is Visible  ${NextPage}
  Click Element  ${NextPage}
   
Know Me 
    Assertion Text  ناموجود
    Click   ${knowMe}
    Assertion Text  اگر کالا موجود شد، چطور به شما اطلاع دهیم؟
    Click   ${messege}
    Assertion Text  ثبت
    Click   ${submit}
    Assertion Text  دیگر لازم نیست خبرم کنید


    

