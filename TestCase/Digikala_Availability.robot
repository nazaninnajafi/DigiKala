*** Settings ***
Documentation  Availability

Library           SeleniumLibrary

Resource          ../Resources/commonfunctionality.robot
Resource          ../Resources/PageObjects/Login.robot
Resource          ../Resources/PageObjects/Buy_product.robot
Resource          ../Resources/PageObjects/Availability.robot

Suite Setup     Open Page  
# Open DigiKala And Login
Suite Teardown    Close Page


*** Variables ***
${PProduct}       xpath://div[@class='d-flex flex-wrap']//span[contains(text(),'ناموجود')]     


*** Test Cases ***
This is Availability Test for digikala.com
  Select Category
  Click  ${BestSelling} 
  Add Filter  برند  ${Brand}  ${BrandName} 
  Next Page
  Find and Select Product  ${PProduct}
  Know Me 
