*** Settings ***
Library  SeleniumLibrary
Resource  ../resources/common.robot

*** Variables ***
${URL}  https://www.familysearch.org
${Browser}  Chrome

*** Test Cases ***
case_001 Login and search for a member
    Open Browser  ${URL}  ${Browser}
    Maximize Window and Accept Cookie
    Authentication
    Sleep and Close Browser