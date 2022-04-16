*** Settings ***
Documentation  Delete Product

Library  SeleniumLibrary

Resource  ../Resources/commonfunctionality.robot
Resource  ../Resources/PageObjects/Login.robot
Resource  ../Resources/PageObjects/Buy_product.robot
Resource  ../Resources/PageObjects/Delete_Product.robot

Suite Setup     Run Keywords  commonfunctionality.Open Page  
...             Login.Verify Login Page Loaded
...             Login.click on login
...             Login.Enter Username and Click
...             Login.Enter Password and Click
Suite Teardown  commonfunctionality.Close Page

Force Tags  DigiKala_Delete_Product


*** Test Cases ***
This is Delete_product TestCase for digikala.com
    Click   xpath://a[@href="/best-selling/"]   
    Find and Select Product    ${Productt}
    Click   ${cartButton}
    Remove Product
    # assertion Text  سبد خرید شما خالی است