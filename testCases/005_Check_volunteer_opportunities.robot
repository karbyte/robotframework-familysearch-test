*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/common.robot

Test Setup  Open Browser, Maximize Window and Accept Cookie
Test Teardown  Sleep and Close Browser

*** Test Cases ***
005_Check_volunteer_opportunities_and_load_the_contact_form
    Logging into user account    Username=karbyte    Password=awds1234
    Clicking Volunteer tab
    Getting into Learn More about history tab
    Getting on the form page