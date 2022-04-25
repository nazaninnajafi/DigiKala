*** Settings ***
Documentation  Buy product

Library         SeleniumLibrary

Resource        ../Resources/commonfunctionality.robot
Resource        ../Resources/PageObjects/Login.robot
Resource        ../Resources/PageObjects/Buy_product.robot

Suite Setup     Run Keywords  commonfunctionality.Open Page  
...             Login.Verify Login Page Loaded
...             Login.click on login
...             Login.Enter Username and Click
...             Login.Enter Password and Click
Suite Teardown  commonfunctionality.Close Page

Force Tags      Digikala_Buy_product


*** Test Cases ***
This is Buy_product TestCase for digikala.com
  Select Category
  Filters
  BestSelling Tab And Next Page And Select Product
  Cart