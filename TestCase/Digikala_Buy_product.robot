*** Settings ***
Documentation  Buy product

Library  SeleniumLibrary

Resource  ../Resources/commonfunctionality.robot
Resource  ../Resources/PageObjects/Login.robot
Resource  ../Resources/PageObjects/Buy_product.robot

Suite Setup     Run Keywords  commonfunctionality.Open Page  
...             Login.Verify Login Page Loaded
Suite Teardown  commonfunctionality.Close Page

Force Tags  Digikala_Buy_product

*** Test Cases ***
This is Buy_product TestCase for digikala.com
  Login.click on login
  Login.Enter Username and Click
  Login.Enter Password and Click

  Select Category
  Filters
  Click   ${Best_selling}
  Find and Select Product   ${Productt} 
  Cart