*** Settings ***
Documentation  DataDriven

Library  SeleniumLibrary

Resource  ../Resources/commonfunctionality.robot
Resource  ../Resources/PageObjects/Login.robot
Resource  ../Resources/PageObjects/DataDriven.robot

Suite Setup     Run Keywords  commonfunctionality.Open Page  
...             Login.Verify Login Page Loaded
Suite Teardown  commonfunctionality.Close Page

Test Template   DataDriven.Category


*** Variables ***
${Domestic_Magazines}       xpath://*[@id="__next"]/div[1]/div[3]/div[3]/div[1]/div[1]/div[2]/a[1]
#xpath://a[@href="/search/category-domestic-magazines/"]
${Foreign_Magazines}        xpath://*[@id="__next"]/div[1]/div[3]/div[3]/div[1]/div[1]/div[2]/a[2]
#xpath://a[@href="/search/category-magazine/"]


*** Test Cases ***
This is DigiKala_DataDriven for Domestic_Magazines  ${Domestic_Magazines}
This is DigiKala_DataDriven for Foreign_Magazines   ${Foreign_Magazines}

