*** Settings ***
Documentation   Login DigiKala
Library         SeleniumLibrary

Resource        ../Resources/commonfunctionality.robot
Resource        ../Resources/PageObjects/Login.robot

Suite Setup     Open And Login
Suite Teardown  commonfunctionality.Close Page

Force Tags      Digikala_Login


*** Test Cases ***
This is Login TestCase for digikala.com
  Check Username on Page




