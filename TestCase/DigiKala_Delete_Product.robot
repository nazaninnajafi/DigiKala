*** Settings ***
Documentation    Delete Product

Library          SeleniumLibrary

Resource         ../Resources/commonfunctionality.robot
Resource         ../Resources/PageObjects/Login.robot
Resource         ../Resources/PageObjects/Buy_product.robot
Resource         ../Resources/PageObjects/Delete_Product.robot

Suite Setup      Run Keywords  Open Page
...              Add Product
Suite Teardown   Close Page

Force Tags       DigiKala_Delete_Product


*** Test Cases ***
This is Delete_product TestCase for digikala.com
    Remove Product
    Assertion Text  سبد خرید شما خالی است!

   
    