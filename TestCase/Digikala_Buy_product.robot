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

*** Variables ***
${assertion}      xpath://*[@id="__next"]/div[1]/div[3]/div[3]/div[1]/article/div/div/h2


*** Test Cases ***
This is Buy_product TestCase for digikala.com
  Select Category
  Filters
  Click   ${BestSelling}
  Run Keyword And Ignore Error  Scroll Element Into View  ${assertion}
  Find and Select Product   ${Productt} 
  Cart