*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/common.robot

Test Setup  Open Browser, Maximize Window and Accept Cookie
Test Teardown  Sleep and Close Browser

*** Test Cases ***
testcase_003_Log_into_user_account_and_search_for_a_photo
    Logging into user account  karbyte  awds1234
    Search for a photo  PhotoLocation=${PhotoLocationVariable}