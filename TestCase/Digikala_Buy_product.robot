*** Settings ***
Documentation   Buy product
Library         SeleniumLibrary

Resource        ../Resources/commonfunctionality.robot
Resource        ../Resources/PageObjects/Login.robot
Resource        ../Resources/PageObjects/Buy_product.robot

Suite Setup     Open And Login
Suite Teardown  Close Page

Force Tags      Digikala_Buy_product


*** Test Cases ***
This is Buy_product TestCase for digikala.com
  Select Category
  Filters
  Find Product
  Cart