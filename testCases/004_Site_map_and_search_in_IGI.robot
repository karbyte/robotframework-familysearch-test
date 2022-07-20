*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/common.robot

Test Setup  Open Browser, Maximize Window and Accept Cookie
Test Teardown  Sleep and Close Browser

*** Test Cases ***
testcase_004_Check_the_site_map_and_search_in_International_genealogical_index
    Logging into user account  Username=karbyte  Password=awds1234
    Get into Site Map tab
    Get into IGI tab and search for a person
    Writing name into text field    IGIName=Jan
    Writing surname into text field    IGISurname=Nowak