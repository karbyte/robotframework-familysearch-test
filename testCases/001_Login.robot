*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/common.robot

Test Setup  Open Browser, Maximize Window and Accept Cookie
Test Teardown  Sleep and Close Browser

*** Test Cases ***
testcase_001_Logging_into_user_account
    Logging into user account  Username=karbyte  Password=awds1234