*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/common.robot

Test Setup  Open Browser, Maximize Window and Accept Cookie
Test Teardown  Sleep and Close Browser

*** Test Cases ***
testcase_002_Log_in_and_search_for_a_member
    Logging into user account   karbyte  awds1234
    Search for a member  BirthPlace=${Birth}
    Activating and writing surname  UserSurname=${Surname}
    Activating and writing title