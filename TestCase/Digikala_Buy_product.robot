*** Settings ***
Documentation  Buy product

Library         SeleniumLibrary

Resource        ../Resources/commonfunctionality.robot
Resource        ../Resources/PageObjects/Login.robot
Resource        ../Resources/PageObjects/Buy_product.robot

Suite Setup      Open DigiKala And Login
Suite Teardown   Close Page
# Suite Setup      Open Page
# Suite Teardown   Close Page
Force Tags       Digikala_Buy_product


*** Test Cases ***
This is Buy_product TestCase for digikala.com
  Select Category
  Filters
  BestSelling Tab And Next Page And Select Product
  Cart