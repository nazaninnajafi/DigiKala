*** Settings ***
Documentation  Availability

Library  SeleniumLibrary

Resource  ../Resources/commonfunctionality.robot
Resource  ../Resources/PageObjects/Login.robot
Resource  ../Resources/PageObjects/Buy_product.robot
Resource  ../Resources/PageObjects/Availability.robot

Suite Setup     Run Keywords  commonfunctionality.Open Page  
...             Login.Verify Login Page Loaded
Suite Teardown  commonfunctionality.Close Page

*** Variables ***
${pProduct}        xpath://div[@class='d-flex flex-wrap']//span[contains(text(),'ناموجود')]     


*** Test Cases ***
This is Availability Test for digikala.com
  Login.click on login
  Login.Enter Username and Click
  Login.Enter Password and Click

  Select Category
  Click   ${Best_selling}
 
  Add Filter  برند  ${Brand}  ${Brand_name} 
  Availability.Next Page
  Find and Select Product   ${pProduct}
  Know Me 
