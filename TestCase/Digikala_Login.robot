*** Settings ***
Documentation  Login
Library  SeleniumLibrary

Resource        ../Resources/commonfunctionality.robot
Resource        ../Resources/PageObjects/Login.robot

Suite Setup     Run Keywords  commonfunctionality.Open Page  
...             Login.Verify Login Page Loaded
Suite Teardown  commonfunctionality.Close Page

Force Tags  Digikala_Login


*** Test Cases ***

This is Login TestCase for digikala.com
  Login.click on login
  Login.Enter Username and Click
  Login.Enter Password and Click
  Login.Check Username on Page




