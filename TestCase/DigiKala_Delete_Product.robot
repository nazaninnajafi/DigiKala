*** Settings ***
Documentation    Delete Product

Library          SeleniumLibrary

Resource         ../Resources/commonfunctionality.robot
Resource         ../Resources/PageObjects/Login.robot
Resource         ../Resources/PageObjects/Buy_product.robot
Resource         ../Resources/PageObjects/Delete_Product.robot

# Suite Setup      Run Keywords  Open DigiKala And Login
# ...              Add Product
# Suite Teardown   Close Page
Suite Setup      Run Keywords  Open Page
...              Add Product
Suite Teardown   Close Page

Force Tags       DigiKala_Delete_Product


*** Test Cases ***
This is Delete_product TestCase for digikala.com
    # Click   ${cartButton}
    # Run Keyword If    Page Should Contain  سبد خرید شما خالی است!  Add Product
    # Add Product
    Remove Product
    Assertion Text  سبد خرید شما خالی است!




    # Click   xpath://a[@href="/best-selling/"]   
    # Find and Select Product    xpath://div[@class='d-flex flex-wrap']/div[3]
    # Click   ${AddToCart}
    # Click   ${cartButton}
    
    # Click   ${cartButton}
    # # ${Page Should Not Contain}   Page Should Not Contain  سبد خرید شما خالی است!
    # Run Keyword If    '${Page Should Not Contain}' == 'FAIL'  Add Product 


    
    
    # Click   xpath://a[@href="/best-selling/"]   
    # Find and Select Product    xpath://div[@class='d-flex flex-wrap']/div[1]
    # Click   ${AddToCart}
    # Click   ${cartButton}
    # Add Product
    # Log To Console  ${Product_on_page}
    # Remove Products
    
   
    